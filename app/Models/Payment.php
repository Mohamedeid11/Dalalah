<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Payment extends Model
{
    use HasFactory;
    protected $fillable = [
        'amount',
        'payment_type',
        'paymentable_id',
        'paymentable_type',
        'package_id',
        'ad_id',
        'status',
        'ad_type',
        'paymentId',
        'paymentType',
        'payment_from',
    ];

    public function getUserTypeAttribute()
    {
        if ($this->paymentable_type == User::class){
            return 'User';
        }else{
            return 'Show Room';
        }
    }

    public function getAdTypeAttribute()
    {
        if ($this->ad_type == Car::class){
            return 'Car';
        }else{
            return 'Car Plate';
        }
    }


    public function paymentable()
    {
        return $this->morphTo();
    }

    public function ad()
    {
        return $this->morphTo();
    }

    public function package() : BelongsTo
    {
        return $this->belongsTo(Package::class,'package_id');
    }
}
