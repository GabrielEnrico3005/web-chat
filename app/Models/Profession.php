<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Profile;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Profession extends Model
{
    use HasFactory;
    protected $guarded=[];

    public function profiles()
    {
        return $this->belongsToMany(Profile::class, 'profile_profession', 'profession_id', 'profile_id');
    }
}
