<?php

namespace App\Http\Controllers;

use App\Models\Notification;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class NotificationController extends Controller
{
    public function notifications()
    {
        $notifications = Notification::where('user_id', auth()->id())
            ->orderBy('created_at', 'desc')
            ->paginate(10); // Sesuaikan jumlah per halaman

        // set semua telah dibaca
        foreach ($notifications as $notification) {
            $notification->read = true;
            $notification->save();
        }
        return view('notifications.index', compact('notifications'));
    }
    /*  */
}
