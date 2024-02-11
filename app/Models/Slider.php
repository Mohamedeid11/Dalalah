<?php

namespace App\Models;

use App\Traits\HandleUploadFile;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\Translatable\HasTranslations;

class Slider extends Model implements HasMedia
{
    use HasFactory, InteractsWithMedia , HandleUploadFile , HasTranslations ;
    protected $guarded = [];
    public $translatable = ['title','content'];

    public function getAvatar()
    {
        return  $this->getFirstMediaUrl('sliders') == null ? '' : $this->getFirstMediaUrl('sliders');
    }

    public function getCreatedAt(): string
    {
        return $this->created_at->format('Y-m-d');
    }

    public function showroom() : BelongsTo
    {
        return $this->belongsTo(Showroom::class);
    }
}
