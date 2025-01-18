<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function showLoginForm()
    {
        return view('auth.login');
    }

    public function login(Request $request)
    {
        $credentials = $request->validate([
            'email' => 'required|email',
            'password' => 'required|string|min:6',
        ]);

        if (Auth::attempt($credentials)) {
            $user = Auth::user();

            // Check if the user's profile status is unpaid
            if ($user->profile->status === 'unpaid') {
                return redirect()->route('payment.page')->with('info', __('Please complete your payment to proceed.'));
            }

            // Redirect to dashboard if paid
            return redirect()->route('home')->with('success', 'Welcome back!');
        }

        return back()->withErrors(['email' => __('Invalid credentials')])->withInput();
    }

    public function logout(Request $request)
    {
        Auth::logout(); // Logout user

        // Optional: Invalidate session and regenerate CSRF token
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        // Redirect user to the login page or home
        return redirect('/')->with('success', 'You have been logged out.');
    }
}
