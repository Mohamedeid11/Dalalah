<?php

namespace App\ModelFilters;

use App\Models\Admin;
use App\Models\Showroom;
use App\Models\User;
use EloquentFilter\ModelFilter;
use Illuminate\Support\Str;
use Spatie\Permission\Commands\Show;


class CarFilter extends ModelFilter
{

    public function stringUpperToLower(string $value): string
    {
        return Str::lower($value);
    }

    public function search($search)
    {
        if (isStringEnglishLetters($search)) {
            return  $this->WhereHas('brand',function($q) use($search){
                            $q->whereRaw("LOWER(JSON_UNQUOTE(JSON_EXTRACT(name, '$.en'))) LIKE ?", ["%{$this->stringUpperToLower($search)}%"]);
                        });
        }

        if (isStringEnglishLetters($search) == false) {
            return $this->WhereHas('brand',function($q) use($search){
                        $q->where('name','LIKE', "%{$search}%");
                    });
        }
    }

    public function driveType($type)
    {
        return $this->where('drive_type' , $type);
    }

    public function fuelType($type)
    {
        return  $this->where('fuel_type' , $type);
    }

    public function fuelTypes($types)
    {
        return  $this->whereIn('fuel_type' , $types);
    }

    public function startPrice($price)
    {
       return  $this->where('price' ,'>=', $price);
    }

    public function endPrice($price)
    {
       return  $this->where('price' ,'<=', $price);
    }

    public function startYear($year)
    {
        return $this->where('year' ,'>=', $year);
    }

    public function years($years)
    {
       return  $this->whereIn('year' , $years);
    }

    public function endYear($year)
    {
       return $this->where('year' ,'<=', $year);
    }

    public function status($status)
    {
        return $this->where('status',$status);
    }

    public function modelRole($modelRole)
    {
        if($modelRole == 'user'){
            return $this->where('model_name' , User::class);
        }elseif($modelRole == 'admin'){
            return $this->where('model_name' , Admin::class);
        }else{
            return $this->where('model_name' , Showroom::class)->whereHas('showroom' , function($q) use($modelRole){
                return $q->where('type' , $modelRole);
            });
        }
    }

    public function id($modelId)
    {
        return $this->where('model_id',$modelId);
    }

    public function brand($brandId)
    {
        return $this->where('brand_id',$brandId);
    }

    public function allBrands($allBrands)
    {
        return $this->whereIn('brand_id',$allBrands);
    }

    public function allModels($allModels)
    {
        return $this->whereIn('car_model_id',$allModels);
    }

    public function allExtensions($allExtensions)
    {
        return $this->whereIn('car_model_extension_id',$allExtensions);
    }

    public function allFeatures($allFeatures){
        return $this->whereHas('options',function($q) use($allFeatures){
            return $q->whereIn('id',$allFeatures);
        });
    }

    public function title($title)
    {
        return $this->where('title', $title);
    }

    public function carModel($carModel)
    {
        return $this->where('car_model_id', $carModel);
    }

}
