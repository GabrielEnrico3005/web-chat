<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\MessageController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Session;

Route::get('/', [HomeController::class, 'index']);
Route::get('/home', [HomeController::class, 'index'])->name('home');


Route::get('/change-language/{locale}', function ($locale) {
    if (in_array($locale, ['en', 'id'])) {
        app()->setLocale($locale);
        Session::put('locale', $locale);
    }
    return redirect()->back();
})->name('change-language');


Route::middleware('guest')->group(function () {
    Route::get('/register', [RegisterController::class, 'showRegisterForm'])->name('register');
    Route::post('/register', [RegisterController::class, 'register']);

    Route::get('/login', [LoginController::class, 'showLoginForm'])->name('login');
    Route::post('/login', [LoginController::class, 'login'])->name('login.process');

});

Route::middleware('auth')->group(function () {
    Route::post('/logout', [LoginController::class, 'logout'])->name('logout');

    Route::get('/payment', [PaymentController::class, 'showPaymentPage'])->name('payment.page');
    Route::post('/payment', [PaymentController::class, 'processPayment'])->name('payment.process');

    Route::post('/add-friend/{id}', [HomeController::class, 'addFriend'])->name('add-friend');

    Route::get('/profile', [ProfileController::class, 'index'])->name('profile');
    Route::post('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::get('/profile/{id}', [ProfileController::class, 'show'])->name('profile.show');
    Route::get('/profile/visible/toggle', [ProfileController::class, 'visible'])->name('profile.visible');
    Route::get('/profile/avatar_update/{id}', [ProfileController::class, 'update_avatar'])->name('profile.avatar.update');

    Route::post('/purchase/avatar/{id}', [PaymentController::class, 'purchase_avatar'])->name('purchase.avatar');
    Route::get('/purchase/coin', [PaymentController::class, 'purchase_coin'])->name('purchase.coin');

    Route::get('/messages/{id}', [MessageController::class, 'index'])->name('messages.index');
    Route::post('/messages/send', [MessageController::class, 'sendMessage'])->name('messages.send');
    Route::post('/messages/send_avatar', [MessageController::class, 'sendMessageAvatar'])->name('messages.send_avatar');
    Route::post('/messages/fetch', [MessageController::class, 'fetchMessages'])->name('messages.fetch');
    Route::get('/messages', [MessageController::class, 'messageList'])->name('messages.list');
    Route::get('/save_sticker/{id}', [MessageController::class, 'saveSticker'])->name('save_sticker');
    
    Route::get('/notifications', [NotificationController::class, 'notifications'])->name('notifications.index');
    
    
    
});
