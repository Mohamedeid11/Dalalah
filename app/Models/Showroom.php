<?php

namespace App\Models;

use App\Models\Branch;
use App\Traits\HandleUploadFile;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
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
use Spatie\Translatable\HasTranslations;


class Showroom  extends Authenticatable implements HasMedia
{
    use HasFactory ,
        HandleUploadFile ,
        InteractsWithMedia,
        HasTranslations,
        HasApiTokens ,
        Notifiable,
        SoftDeletes;

    public $translatable = ['showroom_name','owner_name','description'];
    protected $guarded = ['id'];
    protected $appends = ['name'];
    protected $casts = [
        'expired_date' => 'datetime',
    ];

    public function setPasswordAttribute($value)
    {
        $this->attributes['password'] = Hash::make($value);
    }

    public function getNameAttribute()
    {
        return $this->getTranslation('showroom_name', app()->getLocale());
    }

    public function getAddress(){
        if (!$this->city){
            return ' ';
        }
        return $this->city?->name . '  , ' . $this->district?->name;
    }

    public function getToken(){
        return $this->createToken(uniqid(),['showroom'])->accessToken;
    }

    public function isBlocked(){
        return $this->is_blocked == 0 ? false : true;
    }

    public function cars(){
        return $this->hasMany(Car::class,'model_id','id');
        // return $this->morphToMany(Car::class,'model_id','id');
        //  return $this->morphMany(Car::class, 'model');
    }

    public function scopeHidden($query , $type)
    {
        return $query->where('is_hide', $type);
    }

    // User.php
    public function carPlates()
    {
        return $this->hasMany(CarPlate::class);
    }

    public static function countShowroom()
    {
        return Cache::remember('count_showrooms', 60, function () {
            return static::query()->where('type','showroom')->count();
        });
    }

    public static function countAgency()
    {
        return Cache::remember('count_agencies', 60, function () {
            return static::query()->where('type','agency')->count();
        });
    }

    public function city(){
        return $this->belongsTo(City::class);
    }

    public function district(){
        return $this->belongsTo(District::class);
    }

    public function branches()
    {
        return $this->hasMany(Branch::class);
    }

    public function getCreatedAt(): string
    {
        return $this->created_at->format('Y-m-d');
    }

    public function getExpiredDate(): string
    {
        if($this->expired_date){
            return date('Y-m-d' , strtotime($this->expired_date));
        }
        return '--';
    }

    public function getLogo()
    {
        return  $this->getFirstMediaUrl('showrooms-logo') == null
                ? asset('end-user/assets/img/logo/logo-nav.png')
                : $this->getFirstMediaUrl('showrooms-logo');
    }

    public function getAVGRateAttribute()
    {
       return number_format($this->rate->avg('rate'), 2);
    }

    public function getCoverImage()
    {
        return  $this->getFirstMediaUrl('showrooms-cover_image') == null
                ? asset('end-user/assets/img/logo/logo-nav.png')
                : $this->getFirstMediaUrl('showrooms-cover_image');
    }

    public function getNewCars()
    {
        return $this->cars()->with('media')->where('status' , 'new')->paginate(8);
    }

    public function getUsedCars()
    {
        return $this->cars()->with('media')->where('status' , 'used')->paginate(8);
    }

    public function package()
    {
        return $this->belongsTo(Package::class);
    }

    public function rate(): HasMany
    {
        return $this->hasMany(Rating::class,'showroom_id');
    }

    public function reviews() : hasMany
    {
        return $this->hasMany(Review::class , 'showroom_id');
    }

    public function favoritPLates(): BelongsToMany
    {
        return $this->belongsToMany(CarPlate::class, 'favorites', 'showroom_id' , 'plate_id')->withTimestamps();
    }

    public function followers()
    {
        return $this->belongsToMany(User::class, 'follow_showroom_user');
    }

    public function priceRequests()
    {
        return $this->belongsToMany(User::class, 'request_prices')->withPivot('showroom_id');
    }

    public function payments()
    {
        return $this->morphMany(Payment::class, 'paymentable');
    }

}
