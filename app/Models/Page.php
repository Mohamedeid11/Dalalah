<?php

namespace App\Models;

use App\Traits\HandleUploadFile;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\Translatable\HasTranslations;

class Page extends Model implements HasMedia
{
    use HasFactory , InteractsWithMedia , HandleUploadFile , HasTranslations ;
    public $translatable = ['name','content'];
    protected $guarded = ['id'];  
    
    public function getAvatar()
    {
        return  $this->getFirstMediaUrl('pages') == null 
                ? asset('end-user/assets/img/logo/logo-nav.png')
                : $this->getFirstMediaUrl('pages');
    }
    
}
