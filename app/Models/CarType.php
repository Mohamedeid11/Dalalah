<?php

namespace App\Models;

use App\Traits\HandleUploadFile;
use EloquentFilter\Filterable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\Translatable\HasTranslations;

class CarType extends Model implements HasMedia
{ 
    use HasFactory , InteractsWithMedia , HandleUploadFile , Filterable , HasTranslations ;
    protected $guarded = [];
    public $translatable = ['name'];

    public function getIcon()
    {
        return  $this->getFirstMediaUrl('car_types-icon') == null 
                ? ''
                : $this->getFirstMediaUrl('car_types-icon');
    }

    public function getCreatedAt(): string
    {
        return $this->created_at->format('Y-m-d');
    }

    public function cars(){
        return $this->hasMany(Car::class);
    }
    
}
