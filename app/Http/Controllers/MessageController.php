<?php

namespace App\Http\Controllers;

use App\Models\AvatarUser;
use Illuminate\Http\Request;
use App\Models\Message;
use App\Models\Notification;
use App\Models\Profession;
use App\Models\User;

class MessageController extends Controller
{
    public function index($id)
    {
        $receiver = User::findOrFail($id);
        $messages = Message::where(function ($query) use ($id) {
            $query->where('user_id', auth()->id())
                  ->where('receiver_id', $id);
        })->orWhere(function ($query) use ($id) {
            $query->where('user_id', $id)
                  ->where('receiver_id', auth()->id());
        })->orderBy('created_at', 'asc')->get();
        $ownedAvatarIds = AvatarUser::where('user_id', auth()->id())->pluck('profession_id')->toArray();
        foreach($messages as $m){
            if($m->type=='avatar'){
                $m->avatar_id=$m->message;
                $m->image_url = Profession::find($m->message)->image;
                if($m->user_id == $id){
                    $m->hasOwnedAvatar = auth()->user()->avatars()->where('profession_id',$m->message)->exists();   
                }
                $m->message=__('Sent sticker');
            }
        }

        // Ambil avatar yang sesuai dengan profession user dan belum dimiliki
        $avatars = Profession::whereIn('id', $ownedAvatarIds)->get();
        return view('messages.index', compact('receiver', 'messages','avatars'));
    }

    public function sendMessage(Request $request)
    {
        $request->validate([
            'message' => 'required|string',
            'receiver_id' => 'required|exists:users,id',
        ]);

        $message = Message::create([
            'user_id' => auth()->id(),
            'receiver_id' => $request->receiver_id,
            'message' => $request->message,
            'type' => $request->type ?? 'text',
        ]);

        return response()->json([
            'success' => true,
            'message' => $message,
        ]);
    }

    public function sendMessageAvatar(Request $request)
    {
        $request->validate([
            'message' => 'required',
            'receiver_id' => 'required|exists:users,id',
        ]);

        $message = Message::create([
            'user_id' => auth()->id(),
            'receiver_id' => $request->receiver_id,
            'message' => $request->message,
            'type' => 'avatar',
        ]);

        $message->avatar_id=$message->message;
        $message->image_url = Profession::find($message->message)->image;
        $message->message=__('Sent sticker');

        return response()->json([
            'success' => true,
            'message' => $message,
        ]);
    }

    public function fetchMessages(Request $request)
    {
        $messages = Message::where('receiver_id', auth()->id())
                            ->where('user_id', $request->sender_id)
                            ->where('read_at', null)
                            ->orderBy('created_at', 'asc')->get();
        $ownedAvatarIds = AvatarUser::where('user_id', auth()->id())->pluck('profession_id')->toArray();
        // update read_at, jadi sekarang
        foreach ($messages as $message) {
            $message->update(['read_at' => now()]);
            if ($message->type === 'avatar') {
                $avatarProfession = Profession::find($message->message);
    
                if ($avatarProfession) {
                    $message->image_url = $avatarProfession->image;
                    $message->hasOwnedAvatar = in_array($message->message, $ownedAvatarIds);
                }
    
                $message->avatar_id = $message->message;
                $message->message = __('Sent sticker');
            }
        }
        return response()->json($messages);
    }
    public function messageList()
    {
        $userId = auth()->id();

        // Ambil pesan terakhir per user (pengirim/penerima) terkait user login
        $messageThreads = Message::selectRaw('
                IF(user_id = ?, receiver_id, user_id) as contact_id,
                MAX(created_at) as last_time
            ', [$userId])
            ->where(function ($query) use ($userId) {
                $query->where('user_id', $userId)
                    ->orWhere('receiver_id', $userId);
            })
            ->groupBy('contact_id')
            ->orderBy('last_time', 'desc')
            ->get();

        // Susun data untuk setiap thread
        $threads = $messageThreads->map(function ($thread) use ($userId) {
            $contact = User::find($thread->contact_id);

            $lastMessage = Message::where(function ($query) use ($thread, $userId) {
                $query->where('user_id', $userId)->where('receiver_id', $thread->contact_id);
            })->orWhere(function ($query) use ($thread, $userId) {
                $query->where('user_id', $thread->contact_id)->where('receiver_id', $userId);
            })->latest('created_at')->first();

            

            return [
                'contact' => $contact,
                'last_message' => $lastMessage->message ?? '',
                'type'=>$lastMessage->type ?? '',
                'last_time' => $lastMessage->created_at ?? now(),
            ];
        });

        return view('messages.list', compact('threads'));
    }

    public function saveSticker($id){
        $avatar = Profession::find($id);
        if(!$avatar){
            return redirect()->back()->with('error',  __('Avatar not found'));
        }
        $user = auth()->user();
        if($user->avatars()->where('profession_id',$id)->exists()){
            return redirect()->back()->with('error', __('Avatar has already owned'));
        }
         // tambahkan ke table avatar_users
        $avatar_user = $user->avatars()->create([
            'profession_id' => $id,
            'status'=>'confirmed',
            'from_user_id'=>$user->id,
        ]);
        // cek ada avatar_user yang is_active true tidak, jika tidak ada maka set ke true
        $has_active_avatar = $user->avatars()->where('is_active',true)->first();
        if(!$has_active_avatar){
            $avatar_user->is_active = true;
            $avatar_user->save();
        }
        // insert ke notifikiasi
        $notify = Notification::create([
            'user_id'=>$user->id,
            'type' => __('Avatar Save'),
            'title'=> __('Avatar Save Success'),
            'message'=> __('You have save :name', ['name' => $avatar->name]),
            'read'=>false,
            'url'=>route('profile'),
        ]);
        return redirect()->back()->with('success', __('Avatar saved successfully'));
    }

}
