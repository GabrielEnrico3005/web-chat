<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AvatarUser extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function fromUser(){
        return $this->belongsTo(User::class,'from_user_id');
    }

    public function profession(){
        return $this->belongsTo(Profession::class);
    }
}
