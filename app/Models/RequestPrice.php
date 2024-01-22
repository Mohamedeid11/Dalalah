<?php

namespace App\Models;

use EloquentFilter\Filterable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class RequestPrice extends Model
{
    use HasFactory  , Filterable;

    protected $fillable = [ 'user_id', 'showroom_id', 'car_id'];

    public function car() : BelongsTo
    {
        return $this->belongsTo(Car::class , 'car_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function showroom()
    {
        return $this->belongsTo(Showroom::class, 'showroom_id');
    }

}
