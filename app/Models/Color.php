<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\Translatable\HasTranslations;

class Color extends Model 
{
    use HasFactory , HasTranslations ;
    protected $guarded = [];
    public $translatable = ['name'];

    public function getCreatedAt(): string
    {
        return $this->created_at->format('Y-m-d');
    }
    
}
