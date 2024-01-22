<?php

namespace App\ModelFilters;

use App\Models\Admin;
use App\Models\Showroom;
use App\Models\User;
use EloquentFilter\ModelFilter;
use Illuminate\Support\Str;
use Spatie\Permission\Commands\Show;


class CarPlateFilter extends ModelFilter
{
    public function stringUpperToLower(string $value): string
    {
        return Str::lower($value);
    }

    public function search($value)
    {
        $data = $this->where('plate_number', $value);

        if (isStringEnglishLetters($value)) {
            $data->orWhere('letter_en','LIKE', "%{$this->stringUpperToLower($value)}%");
        }

        if (isStringEnglishLetters($value) == false) {
             $data->orWhere('letter_ar','LIKE', "%{$value}%");
        }

        return $data;
    }

    public function letter($value)
    {
        if (isStringEnglishLetters($value)) {
            return $this->where('letter_en','LIKE', "%{$this->stringUpperToLower($value)}%");
        }

        if (isStringEnglishLetters($value) == false) {
            return $this->where('letter_ar','LIKE', "%{$value}%");

        }
    }

    public function number($value)
    {
        return $this->where('plate_number', $value );
    }

    public function plateType($value)
    {
        return $this->where('plate_type', $value );
    }

    public function location($value)
    {

        if (isStringEnglishLetters($value)) {

            return  $this->WhereHas('city',function($q) use($value){

                $q->whereRaw("LOWER(JSON_UNQUOTE(JSON_EXTRACT(name, '$.en'))) LIKE ?", ["%{$this->stringUpperToLower($value)}%"]);

            })->orWhereHas('district',function($q) use($value){

                $q->whereRaw("LOWER(JSON_UNQUOTE(JSON_EXTRACT(name, '$.en'))) LIKE ?", ["%{$this->stringUpperToLower($value)}%"]);

            });
        }

        if (isStringEnglishLetters($value) == false) {

            return $this->WhereHas('city',function($q) use($value){

                $q->where('name','LIKE', "%{$value}%");

            })->orWhereHas('district',function($q) use($value){

                $q->where('name','LIKE', "%{$value}%");
            });
        }

    }

    public function startPrice($price)
    {
       return  $this->where('price' ,'>=', $price);
    }

    public function endPrice($price)
    {
       return  $this->where('price' ,'<=', $price);
    }

    public function dateFrom($value)
    {
        return $this->whereDate('created_at', '>=', $value);
    }

    public function dateTo($value)
    {
        return $this->whereDate('created_at', '<=', $value);
    }
}
