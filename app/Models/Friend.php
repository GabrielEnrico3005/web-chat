<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Friend extends Model
{
    use HasFactory;

    protected $guarded=[];

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function userFriend(){
        return $this->belongsTo(User::class, 'friend_id');
    }

    public function profile()
    {
        return $this->hasOneThrough(Profile::class, User::class, 'id', 'user_id', 'friend_id', 'id');
    }

    public function friend()
    {
        return $this->belongsTo(User::class, 'friend_id', 'id');
    }
}
