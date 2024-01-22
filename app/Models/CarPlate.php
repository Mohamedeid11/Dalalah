<?php

namespace App\Models;


use App\Http\Resources\CityResource;
use App\ModelFilters\CarPlateFilter;
use App\Traits\HandleUploadFile;
use EloquentFilter\Filterable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Support\Facades\Cache;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;


class CarPlate extends Model implements HasMedia
{
    use HasFactory  , InteractsWithMedia , HandleUploadFile , Filterable ;

    protected $fillable = [ 'letter_ar' , 'letter_en','plate_number' , 'price' ,'plate_type'  , 'bought_status',
        'ad_type' , 'expired_at', 'user_id' , 'showroom_id', 'city_id' ,'district_id' , 'is_hide', 'is_paused' ,'is_approved'];

    protected $guarded = [];


    public function user()
    {
        return $this->belongsTo(User::class , 'user_id','id');
    }

    public function showroom()
    {
        return $this->belongsTo(Showroom::class , 'showroom_id','id');
    }

    public function city()
    {
        return $this->belongsTo(City::class);
    }

    public function district()
    {
        return $this->belongsTo(District::class);
    }


    public function getAddress()
    {
        if($this->branch){
            return $this->branch->city->name . '  , ' . $this->branch->district->name;
        }elseif($this->model_name == Admin::class){
            return 'admin';
        }
        return $this->city?->name . '  , ' . $this->district?->name;
    }

    public function modelFilter()
    {
        return $this->provideFilter(CarPlateFilter::class);
    }

    public function getCityObject()
    {
        if($this->city){
            return  new CityResource($this->city);
        }
        return null;
    }

    public static function count()
    {
        return Cache::remember('count_cars', 60, function () {
            return static::query()->count();
        });
    }

    public function getCreatedAt(): string
    {
        return $this->created_at->format('Y-m-d');
    }

    public function getCreatedAtFormat(): string
    {
        return $this->created_at->format('D , M d ,Y');
    }

    public function getPrice()
    {
        return number_format($this->price);
    }

    public function scopeApproved($query)
    {
        return $query->where('is_approved', 1);
    }

    public function scopeHidden($query , $type)
    {
        return $query->where('is_hide', $type);
    }

    public function scopeStatus($query, $type)
    {
        return $query->where('bought_status', $type);
    }

    public function getDateHuman(){
        return $this->created_at->diffForHumans();
    }

    public function favorites(): BelongsToMany
    {
        return $this->belongsToMany(CarPlate::class, 'favorites',  'car_id' , 'user_id')->withTimestamps();
    }


    public function reviews()
    {
        return $this->hasMany(Review::class , 'plate_id');
    }

    public function payments()
    {
        return $this->morphMany(Payment::class, 'ad');
    }

}
