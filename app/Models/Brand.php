<?php

namespace App\Models;

use App\Traits\HandleUploadFile;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\Translatable\HasTranslations;

class Brand extends Model implements HasMedia
{
    use HasFactory ,
        HandleUploadFile ,
        InteractsWithMedia,
        HasTranslations;
        
    public $translatable = ['name'];
    protected $guarded = ['id'];   

    public function getAvatar(){
        return  $this->getFirstMediaUrl('brands') == null 
        ? asset('end-user/assets/img/logo/logo-nav.png')
        : $this->getFirstMediaUrl('brands');
    }

    public function getCreatedAt(): string
    {
        return $this->created_at->format('Y-m-d');
    }
    
}
