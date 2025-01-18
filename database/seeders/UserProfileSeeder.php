<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Profile;
use Illuminate\Support\Facades\Hash;

class UserProfileSeeder extends Seeder
{
    public function run()
    {
        // Generate 30 users with profiles
        for ($i = 1; $i <= 30; $i++) {
            // Create user
            $user = User::create([
                'name' => "User $i",
                'email' => "user$i@example.com",
                'password' => Hash::make('password'), // Replace with your preferred password
            ]);

            // Create profile
            $profile = Profile::create([
                'user_id' => $user->id,
                'gender' => $i % 2 == 0 ? 'male' : 'female',
                'linkedin' => "linkedin.com/in/user$i",
                'mobile_number' => "123456789$i",
                'dob' => now()->subYears(rand(18, 50))->format('Y-m-d'),
                'status' => 'paid',
                'visibility' => 'visible',
                'registration_price' => rand(100000, 125000),
            ]);

            // Attach professions (3 to 10 random professions)
            $professionIds = collect(range(1, 60))->random(rand(3, 10));
            $profile->professions()->attach($professionIds);

            // Attach cities (2 to 10 random cities)
            $cityIds = collect(range(1, 499))->random(rand(2, 10));
            $profile->cities()->attach($cityIds);
        }
    }
}
