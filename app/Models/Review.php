<?php

namespace App\Models;

use EloquentFilter\Filterable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Review extends Model
{
    use HasFactory  , Filterable;

    protected $fillable = [ 'body', 'user_id', 'showroom_id', 'car_id', 'reported', 'plate_id',];

    public function car() : BelongsTo
    {
        return $this->belongsTo(Car::class , 'car_id');
    }

    public function plate() : BelongsTo
    {
        return $this->belongsTo(CarPlate::class , 'plate_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function showroom()
    {
        return $this->belongsTo(Showroom::class, 'showroom_id');
    }


    public function scopeNotReported()
    {
        return $this->where('reported' , '0');
    }

    public function scopeReported()
    {
        return $this->where('reported' , '1');
    }
//    public function modelFilter()
//    {
//        return $this->provideFilter(CarFilter::class);
//    }
}
