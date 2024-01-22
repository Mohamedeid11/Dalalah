<?php

namespace App\Models;

use App\Traits\HandleUploadFile;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\Translatable\HasTranslations;

class FeatureOption extends Model implements HasMedia
{
    use HasFactory , HasTranslations , InteractsWithMedia , HandleUploadFile ;
    public $translatable = ['name'];
    protected $guarded = ['id'];

    protected $appends = ['feature_name'];

    public function getFeatureNameAttribute()
    {
        return $this->feature->name;
    }

    public function feature()
    {
        return $this->belongsTo(Feature::class);
    }

    public function getIcon()
    {
        return  $this->getFirstMediaUrl('feature_options-icon') == null 
                ? ''
                : $this->getFirstMediaUrl('feature_options-icon');
    } 
    
}
