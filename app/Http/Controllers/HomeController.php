<?php

namespace App\Http\Controllers;

use App\Models\City;
use App\Models\Friend;
use App\Models\User;
use App\Models\Profession;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class HomeController extends Controller
{
    public function index(Request $request)
    {
        $query = User::with('profile')
            ->whereHas('profile', function ($query) {
                $query->where('status', 'paid')->where('visibility','visible');
            });

        // Filter pencarian nama
        if ($request->filled('search')) {
            $query->where('name', 'like', '%' . $request->search . '%');
        }

        // Filter berdasarkan city atau profession
        if ($request->filled('city')) {
            $query->whereHas('profile.cities', function ($query) use ($request) {
                $query->whereIn('city_id', $request->city);
            });
        }

        if ($request->filled('profession')) {
            $query->whereHas('profile.professions', function ($query) use ($request) {
                $query->whereIn('profession_id', $request->profession);
            });
        }
        if ($request->filled('gender')) {
            $query->whereHas('profile', function ($query) use ($request) {
            $query->whereIn('gender', $request->gender);
            });
        }

        if(auth()->user()){
            $query->whereNot('id',auth()->user()->id);
        }
        
        $query->orderBy('name');

        $users = $query->paginate(12); 
        $cities = City::all(); 
        $professions = Profession::all(); 

        return view('home', compact('users', 'cities', 'professions'));
    }

    public function addFriend($id,Request $request)
    {
        $user = auth()->user();
        $friend = User::findOrFail($id);

        if($request->friend_option=='add'){
            if (!$user->friends->contains($friend)) {
                $user->friendship()->attach($friend->id);
                // insert table notifikasi
                $notify = $user->notifications()->create([
                    'type' => __('Friend Request'),
                    'title'=> __('Friend Request Sent'),
                    'message'=> __('You have sent a friend request to :name', ['name' => $friend->name]),
                    'read'=>false,
                    'url'=>route('profile.show', $friend->id),
                ]);
                // insert ke lawan notifikasi
                $notify = $friend->notifications()->create([
                    'type' => __('Friend Request'),
                    'title'=> __('New Friend Request'),
                    'message'=> __('You have a friend request :name', ['name' => $user->name]),
                    'read'=>false,
                    'url'=>route('profile.show', $user->id),
                ]);
                return back()->with('success', 'Friend added!');
            }
        }elseif($request->friend_option=='confirm'){
            
            $friends_id = $request->friends_id;
            $friends = Friend::find($friends_id);
            $friend = User::findOrFail($friends->user_id);
            if($friends){
                $friends->update([
                    'status' => 'verified',
                ]);
                $save_friend = $user->friendship()->attach($friends->user_id, ['status' => 'verified']);

                $friends->update([
                    'status' => 'verified',
                ]);

                $notify = $user->notifications()->create([
                    'type' => __('Friend Request'),
                    'title'=> __('Friend Request Confirmed'),
                    'message'=> __('You have confirmed a friend request from :name', ['name' => $friend->name]),
                    'read'=>false,
                    'url'=>route('profile.show', $friend->id),
                ]);
                $notify = $friend->notifications()->create([
                    'type' => __('Friend Request'),
                    'title'=> __('Friend Request Confirmed'),
                    'message'=> __('You have confirmed a friend request from :name', ['name' => $friend->name]),
                    'read'=>false,
                    'url'=>route('profile.show', $friend->id),
                ]);
                return back()->with('success', 'Friend added!');
            }
            
        }else{
            if ($user->friendship->contains($friend)) {
                $user->friendship()->detach($friend->id);
                // hapus juga lawannya
                $friend->friendship()->detach($user->id);
                // insert table notifikasi
                $notify = $user->notifications()->create([
                    'type' => __('Friend Request'),
                    'title'=> __('Friend Request Canceled'),
                    'message'=> __('You have canceled a friend request to :name', ['name' => $friend->name]),
                    'read'=>false,
                    'url'=>route('profile.show', $friend->id),
                ]);
                $notify = $friend->notifications()->create([
                    'type' => __('Friend Request'),
                    'title'=> __('Friend Request Canceled'),
                    'message'=> __('You have canceled a friend request from :name', ['name' => $friend->name]),
                    'read'=>false,
                    'url'=>route('profile.show', $friend->id),
                ]);
                    
                return back()->with('success', 'Friend removed!');
            }
        }
    }
}

