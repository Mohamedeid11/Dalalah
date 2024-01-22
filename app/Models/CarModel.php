<?php

namespace App\Models;

use App\ModelFilters\CarModelFilter;
use EloquentFilter\Filterable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\Translatable\HasTranslations;

class CarModel extends Model
{
    use HasFactory , HasTranslations , Filterable;
    public $translatable = ['name'];
    protected $guarded = ['id'];

    public function years()
    {
        return $this->hasMany(CarModelYear::class);
    }

    // public function extensions()
    // {
    //     return $this->hasMany(CarModelExtension::class);
    // }

    public function extensions()
    {
        return $this->belongsToMany(CarModelExtension::class , 'extension_models');
    }

    public function brand()
    {
        return $this->belongsTo(Brand::class);
    }

    public function getExtensions(): string
    {
        if(count($this->extensions)){
            foreach($this->extensions as $extension){
                $all[] = ['value' => $extension->name];
            }
            return \json_encode($all);
        }
        return '';
    }

    public function getCreatedAt(): string
    {
        return $this->created_at->format('Y-m-d');
    }


    public function modelFilter()
    {
        return $this->provideFilter(CarModelFilter::class);
    }
}
