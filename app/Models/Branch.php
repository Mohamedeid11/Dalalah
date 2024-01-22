<?php

namespace App\Models;

use App\Traits\HandleUploadFile;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\Translatable\HasTranslations;

class Branch extends Model implements HasMedia
{
    use HasFactory ,
        HandleUploadFile ,
        InteractsWithMedia,
        HasTranslations;
        
    public $translatable = ['name','address'];
    protected $guarded = ['id'];  

    public function city(){
        return $this->belongsTo(City::class);
    }

    public function district(){
        return $this->belongsTo(District::class);
    }

    public function showroom(){
        return $this->belongsTo(Showroom::class);
    }

    public function cars(){
        return $this->hasMany(Car::class);
    }

    public function getAddress(){
        return is_null($this->address) ? '' : $this->address;
    }

}
