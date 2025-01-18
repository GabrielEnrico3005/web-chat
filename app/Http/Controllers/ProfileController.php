<?php

namespace App\Http\Controllers;

use App\Models\City;
use App\Models\User;
use App\Models\Profile;
use App\Models\AvatarUser;
use App\Models\Profession;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Wallet;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class ProfileController extends Controller
{
    // Menampilkan profil berdasarkan ID pengguna
    public function show($id)
    {
        $user = User::findOrFail($id); // Ambil data user berdasarkan ID
        if($user->profile->visibility=='unvisible'){
            return redirect()->back()->with('error', __('Profile is unvisible'));
        }
        // dan statusnya sudah verified
        $isFriend = auth()->user()->friendship()->where('friend_id', $user->id)->where('status', 'verified')->exists();
        
        return view('profile.show', compact('user', 'isFriend'));
    }

    public function index()
    {
        $user = User::findOrFail(auth()->user()->id); // Ambil data user 
        $professions = Profession::all();
        $cities = City::all();
        // Dapatkan ID avatar yang sudah dimiliki oleh user
        $ownedAvatarIds = AvatarUser::where('user_id', auth()->id())->pluck('profession_id')->toArray();

        // Ambil avatar yang sesuai dengan profession user dan belum dimiliki
        $avatars = Profession::whereNotIn('id', $ownedAvatarIds)->get();
        // dd($ownedAvatarIds,$avatars);

        
        return view('profile.index', compact('user','professions','cities','avatars'));
    }

    public function update(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email,' . auth()->user()->id,
            'password' => 'nullable|string|min:6',
            'gender' => 'required|in:male,female',
            'linkedin' => 'nullable|string|max:255',
            'mobile_number' => 'required|digits_between:10,15',
            'dob' => 'required|date',
            'profession' => 'required|array|min:3',
            'city' => 'required|array|min:1',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput()->with('error', __('Please correct the highlighted errors.'));
        }

        try {
            // Create user
            $user = auth()->user();
            $user->name = $request->name;
            $user->email = $request->email;
            if ($request->filled('password')) {
                $user->password = Hash::make($request->password);
            }
            $user->save();

            // Create profile
            $profile = Profile::updateOrCreate(
                ['user_id' => $user->id],
                [
                    'gender' => $request->gender,
                    'linkedin' => $request->linkedin,
                    'mobile_number' => $request->mobile_number,
                    'dob' => $request->dob,
                ]
            );

            // Attach professions and cities via pivot tables
            $profile->professions()->sync($request->profession);
            $profile->cities()->sync($request->city);
            $notify = $user->notifications()->create([
                'type' => __('Profile Updated'),
                'title'=> __('Avatar Updated'),
                'message'=> __('Your profile has been changed successfully'),
                'read'=>false,
                'url'=>route('profile'),
            ]);

            // Redirect to the payment page
            return redirect()->back()->with('success', __('Profile updated successfully.'));
        } catch (\Exception $e) {
            // dd($e->getMessage());
            return redirect()->back()->withInput()->with('error', __('An error occurred during registration.') . ' ' . $e->getMessage());
        }
    }

    public function update_avatar($id){
        $avatar = AvatarUser::find($id);
        if(!$avatar){
            return redirect()->back()->with('error', __('Avatar not found'));
        }
        
        $user = Auth::user();
        if(!$user->profile->visibility =='visible'){
            return redirect()->back()->with('error', __('Cannot change the avatar. Your profile is hidden.'));
        }
        $user->avatars()->update([
            'is_active' => false
        ]);
        
        $avatar->update([
            'is_active' => true
        ]);

        $notify = $user->notifications()->create([
            'type' => __('Avatar Changed'),
            'title'=> __('Avatar Changed'),
            'message'=> __('Your avatar has been changed successfully'),
            'read'=>false,
            'url'=>route('profile'),
        ]);
        return redirect()->back()->with('success', __('Avatar updated successfully'));
    }

    public function visible(){
        $user = Auth::user();
        
        if($user->profile->visibility =='visible'){
            $price = 50;
            if($user->getWalletBalance() > $price){
                $update = $user->profile->update([
                    'visibility' =>  'unvisible'
                ]);
                
                if($update){
                    Wallet::create([
                        'user_id' => $user->id,
                        'amount' => $price,
                        'type' => 'debit',
                    ]);
                    $notify = $user->notifications()->create([
                        'type' => __('Visibility Changed'),
                        'title'=> __('Profile is unvisible'),
                        'message'=> __('Your profile has been unvisible. Now it is not visible to other users. Your balance has been deducted by :price', ['price' => $price]),
                        'read'=>false,
                        'url'=>route('profile'),
                    ]);
                    return redirect()->back()->with('success', __('Visibility updated successfully'));
                }else{
                    // dd('error');
                }
                
            }else{
                return redirect()->back()->with('error', __('Insufficient balance'));
            }
        }else{
            $price = 5;
            if($user->getWalletBalance() > $price){
                $random_bear = rand(1, 3);
                $path_bear = "bear-$random_bear.png";
                $update= $user->profile->update([
                    'visibility' => 'visible',
                    'bear'=>$path_bear
                ]);
                if($update){
                    Wallet::create([
                        'user_id' => $user->id,
                        'amount' => $price,
                        'type' => 'debit',
                    ]);
                    $notify = $user->notifications()->create([
                        'type' => __('Visibility Changed'),
                        'title'=> __('Profile is unvisible'),
                        'message'=> __('Your profile has been visible. Now it is visible to other users. Your balance has been deducted by :price', ['price' => $price]),
                        'read'=>false,
                        'url'=>route('profile'),
                    ]);
                    return redirect()->back()->with('success', __('Visibility updated successfully'));
                }
                
            }else{
                return redirect()->back()->with('error', __('Insufficient balance'));
            }
        }

        
        
    }
}
