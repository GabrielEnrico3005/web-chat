<?php

namespace App\Http\Controllers;

use App\Models\Profession;
use Illuminate\Http\Request;
use App\Models\Wallet;
use Illuminate\Support\Facades\Auth;

class PaymentController extends Controller
{
    // Menampilkan halaman pembayaran
    public function showPaymentPage()
    {
        $user = Auth::user();
        $registrationPrice = $user->profile->registration_price;

        return view('auth.payment', compact('registrationPrice'));
    }


    public function processPayment(Request $request)
    {
        $request->validate([
            'payment_amount' => 'required|numeric|min:0',
        ]);

        $user = Auth::user();
        $registrationPrice = $user->profile->registration_price;
        $paymentAmount = $request->payment_amount;

        if ($paymentAmount < $registrationPrice) {
            $underpaid = $registrationPrice - $paymentAmount;

            return back()->with('error', "__('You are still underpaid')". number_format($underpaid, 0, ',', '.').".");
        }

        if ($paymentAmount > $registrationPrice) {
            if ($request->wallet_option == 'yes') {
                $overpaid = $paymentAmount - $registrationPrice;

                Wallet::create([
                    'user_id' => $user->id,
                    'amount' => $overpaid,
                    'type' => 'credit',
                ]);

                $user->profile->update(['status' => 'paid']);

                return redirect()->route('home')->with('success', 'Payment successful! Overpaid balance has been added to your wallet.');
            }

            return back()->with(['overpaid'=> $paymentAmount - $registrationPrice,'amout'=>$paymentAmount]);
        }

        $user->profile->update(['status' => 'paid']);

        return redirect()->route('home')->with('success', 'Payment successful! Welcome.');
    }

    public function purchase_avatar($id,Request $request){
        $avatar = Profession::find($id);
        // dd($avatar);
        if(!$avatar){
            return redirect()->back()->with('error', 'Avatar not found');
        }
        $user = Auth::user();
        // check harga dan saldo dari wallet
        // dd($user->getWalletBalance(),$avatar->avatar_price);
        if($user->getWalletBalance() > $avatar->avatar_price){
            // check avatar sudah ada belum
            if($user->avatars()->where('profession_id',$id)->exists()){
                return redirect()->back()->with('error', 'Avatar has already purchased');
            }
             // tambahkan ke table avatar_users
            $avatar_user = $user->avatars()->create([
                'profession_id' => $id,
                'status'=>'confirmed',
                'from_user_id'=>$user->id,
            ]);
            // insert ke wallet
            $user->wallets()->create([
                "amount" => $avatar->avatar_price,
                "type" => "debit",
            ]);
            // cek ada avatar_user yang is_active true tidak, jika tidak ada maka set ke true
            $has_active_avatar = $user->avatars()->where('is_active',true)->first();
            if(!$has_active_avatar){
                $avatar_user->is_active = true;
                $avatar_user->save();
            }
            // insert ke notifikiasi
            $notify = $user->notifications()->create([
                'type' => __('Avatar Purchase'),
                'title'=> __('Avatar Purchase Success'),
                'message'=> __('You have purchased :name', ['name' => $avatar->name]),
                'read'=>false,
                'url'=>route('profile'),
            ]);
            return redirect()->back()->with('success', 'Avatar purchased successfully');
        }else{
            return redirect()->back()->with('error', 'Insufficient balance');
        }
    }

    public function purchase_coin(){
        $user = auth()->user();
        $user->wallets()->create([
            "amount" => 100,
            "type" => "credit",
        ]);
        $notify = $user->notifications()->create([
            'type' => __('Coin Purchase'),
            'title'=> __('Coin Purchase Success'),
            'message'=> __('You have purchased :amount coins', ['amount' => 100]),
            'read'=>false,
            'url'=>route('profile'),
        ]);
        return redirect()->back()->with('success', 'Coin purchased successfully');
    }
}
