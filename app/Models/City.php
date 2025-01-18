<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class City extends Model
{
    use HasFactory;
    protected $guarded=[];

    public function profiles()
    {
        return $this->belongsToMany(Profile::class, 'profile_city', 'city_id', 'profile_id');
    }
}
