<?php

namespace App\Models;

use App\Traits\HandleUploadFile;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class CarReport extends Model implements HasMedia
{
    use HasFactory,InteractsWithMedia,HandleUploadFile;
    protected $guarded = [];

    public function getImage()
    {
        return $this->getFirstMediaUrl('car_reports') == null ? '' :
            $this->getFirstMediaUrl('car_reports');
    }
    
}
