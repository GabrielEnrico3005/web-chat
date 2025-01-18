<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Profile extends Model
{
    use HasFactory;
    protected $guarded=[];

    public function professions()
{
    return $this->belongsToMany(Profession::class, 'profile_professions', 'profile_id', 'profession_id');
}


    public function cities()
    {
        return $this->belongsToMany(City::class, 'profile_cities', 'profile_id', 'city_id');
    }
    

    public function user(){
        return $this->belongsTo(User::class);
    }
}
