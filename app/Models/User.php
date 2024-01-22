<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;

use App\Traits\HandleUploadFile;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Hash;
use Laravel\Passport\HasApiTokens;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class User extends Authenticatable implements HasMedia
{
    use HasApiTokens, HasFactory, Notifiable , InteractsWithMedia , HandleUploadFile , SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $guarded = [];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function setPasswordAttribute($value)
    {
        $this->attributes['password'] = Hash::make($value);
    }

    public function getToken()
    {
        return $this->createToken(uniqid(),['user'])->accessToken;
    }

    public function cars()
    {
        return $this->hasMany(Car::class,'model_id','id');
    }

    public function carPlates()
    {
        return $this->hasMany(CarPlate::class);
    }

    public static function count()
    {
        return Cache::remember('count_users', 60, function () {
            return static::query()->count();
        });
    }

    public function getCreatedAt(): string
    {
        return $this->created_at->format('Y-m-d');
    }

    public function favorites(): BelongsToMany
    {
        return $this->belongsToMany(Car::class, 'favorites', 'user_id' , 'car_id')->withTimestamps();
    }

    public function favoritPLates(): BelongsToMany
    {
        return $this->belongsToMany(CarPlate::class, 'favorites', 'user_id' , 'plate_id')->withTimestamps();
    }

    public function reviews() : hasMany
    {
        return $this->hasMany(Review::class , 'user_id');
    }

    public function city() : BelongsTo
    {
        return $this->belongsTo(City::class, 'city_id');
    }

    public function getLogo()
    {
        return  $this->getFirstMediaUrl('users-logo') == null
                ? asset('end-user/assets/img/account/user.jpg')
                : $this->getFirstMediaUrl('users-logo');
    }

    public function isBlocked(): bool
    {
        return $this->is_blocked == 0 ? false : true;
    }

    public function checkFavorite($car_id): bool
    {
        if (auth('end-user-api')->check() || auth('end-user')->check()){
            $user = auth('end-user')->user() ?? auth('end-user-api')->user();
            return $user->favorites()->wherePivot('car_id', $car_id)->exists();

        }else{

            return false;
        }
    }

    public function showrooms()
    {
        return $this->belongsToMany(Showroom::class, 'follow_showroom_user');
    }

    public function priceRequests()
    {
        return $this->belongsToMany(Showroom::class, 'request_prices')->withPivot('car_id');
    }

    public function payments()
    {
        return $this->morphMany(Payment::class, 'paymentable');
    }

}
