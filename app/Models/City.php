<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\Translatable\HasTranslations;

class City extends Model
{
    use HasFactory , HasTranslations ;
    public $translatable = ['name'];
    protected $guarded = ['id'];

    public function getCreatedAt(): string
    {
        return $this->created_at->format('Y-m-d');
    }

    public function users()
    {
        return $this->hasMany(User::class,'city_id','id');
    }

}
