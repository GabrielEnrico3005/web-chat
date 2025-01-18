<?php

namespace App\Http\Controllers\Auth;

use App\Models\City;
use App\Models\User;
use App\Models\Profile;
use App\Models\Profession;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    public function showRegisterForm()
    {
        $professions = Profession::all();
        $cities = City::all();
        return view('auth.register', compact('professions', 'cities'));
    }

    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users',
            'password' => 'required|string|min:6|confirmed',
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
            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => Hash::make($request->password),
            ]);

            // Create profile
            $profile = Profile::create([
                'user_id' => $user->id,
                'gender' => $request->gender,
                'linkedin' => $request->linkedin,
                'mobile_number' => $request->mobile_number,
                'dob' => $request->dob,
                'status' => 'unpaid',
                'visibility'=>'visible',
                'registration_price' => $request->registration_price,
            ]);

            // Attach professions and cities via pivot tables
            $profile->professions()->attach($request->profession);
            $profile->cities()->attach($request->city);

            // Authenticate the user
            auth()->login($user);

            // Redirect to the payment page
            return redirect()->route('payment.page')->with('success', __('Registration successful. Please proceed to payment.'));
        } catch (\Exception $e) {
            // dd($e->getMessage());
            return redirect()->back()->withInput()->with('error', __('An error occurred during registration.') . ' ' . $e->getMessage());
        }
    }
}
