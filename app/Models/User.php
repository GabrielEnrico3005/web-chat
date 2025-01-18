<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use App\Models\Wallet;
use App\Models\Profile;
use App\Models\AvatarUser;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

    public function wallets()
    {
        return $this->hasMany(Wallet::class);
    }

    public function getWalletBalance()
    {
        $credit = $this->wallets()->where('type', 'credit')->sum('amount');
        $debit = $this->wallets()->where('type', 'debit')->sum('amount');

        return $credit - $debit;
    }


    public function profile()
    {
        return $this->hasOne(Profile::class);
    }

    public function avatars()
    {
        return $this->hasMany(AvatarUser::class);
    }


    public function ownedAvatars()
    {
        return $this->belongsToMany(AvatarUser::class, 'avatar_users', 'user_id', 'avatar_id');
    }



    public function messages()
    {
        return $this->hasMany(Message::class);
    }

    public function friends()
    {
        return $this->hasMany(Friend::class);
    }

    public function friendship()
    {
        return $this->belongsToMany(User::class, 'friends', 'user_id', 'friend_id')->withTimestamps();
    }

    public function friendshipVisible()
    {
        return $this->hasMany(Friend::class, 'friend_id', 'id')->where('status','verified')
        ->whereHas('user.profile', function ($query) {
            $query->where('visibility', 'visible');
        });
    }


    public function friendshipRequests()
    {
        // Relasi antara user dan teman yang belum dikonfirmasi (unverified)
        return $this->hasMany(Friend::class, 'friend_id', 'id')->where('status', 'unverified');
    }



    public function notifications()
    {
        return $this->hasMany(Notification::class);
    }

    public function unreadNotifications()
    {
        return $this->notifications()->where('read', false);
    }
    public function unreadNotificationsCount()
    {
        return $this->unreadNotifications()->count();
    }



    public function unreadMessages()
    {
        return $this->hasMany(Message::class, 'receiver_id')->where('read_at', null);
    }
}
