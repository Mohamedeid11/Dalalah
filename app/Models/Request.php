<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Request extends Model
{
    use HasFactory ;
    protected $guarded = ['id'];

    public function city()
    {
        return $this->belongsTo(City::class);
    }

    public function brand()
    {
        return $this->belongsTo(Brand::class);
    }

    public function brandModel()
    {
        return $this->belongsTo(CarModel::class , 'car_model_id');
    }

    public function brandModelExtension()
    {
        return $this->belongsTo(CarModelExtension::class , 'car_model_extension_id');
    }

    public function getCreatedAt(): string
    {
        return $this->created_at->format('Y-m-d');
    }
    
}
