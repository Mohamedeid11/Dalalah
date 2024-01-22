<?php

namespace App\Models;

use App\Traits\HandleUploadFile;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\Translatable\HasTranslations;

class ReportOption extends Model implements HasMedia
{
    use HasFactory , HasTranslations , InteractsWithMedia , HandleUploadFile ;
    public $translatable = ['name'];
    protected $guarded = ['id'];

    protected $appends = ['report_name'];

    public function getReportNameAttribute()
    {
        return $this->report->name;
    }

    public function report()
    {
        return $this->belongsTo(Report::class);
    }

    public function getIcon()
    {
        return  $this->getFirstMediaUrl('report_options-icon') == null 
                ? ''
                : $this->getFirstMediaUrl('report_options-icon');
    }
    
}
