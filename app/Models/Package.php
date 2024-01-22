<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\Translatable\HasTranslations;

class Package extends Model
{
    use HasFactory , HasTranslations ;
    public $translatable = ['name','description'];
    protected $guarded = [];

    public function getCreatedAt(): string
    {
        return $this->created_at->format('Y-m-d');
    }

    public function showrooms()
    {
        return $this->hasMany(Showroom::class);
    }
    
}
