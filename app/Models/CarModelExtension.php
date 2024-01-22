<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CarModelExtension extends Model
{
    use HasFactory ;
    protected $guarded = ['id'];

    // public function model()
    // {
    //     return $this->belongsTo(CarModel::class, 'car_model_id' , 'id');
    // }
    
    public function model()
    {
        return $this->belongsToMany(CarModel::class, 'extension_models');
    }
    
    public function getCreatedAt(): string
    {
        return $this->created_at->format('Y-m-d');
    }
}
