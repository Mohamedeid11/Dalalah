<?php

namespace App\Models;

use App\Traits\HandleUploadFile;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\Translatable\HasTranslations;

class Setting extends Model implements HasMedia
{
    use HasFactory, InteractsWithMedia , HandleUploadFile , HasTranslations;

    public $translatable = ['value'];
    protected $guarded = ['id'];  
    
}
