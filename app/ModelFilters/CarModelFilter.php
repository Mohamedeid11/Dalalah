<?php

namespace App\ModelFilters;

use App\Models\Admin;
use App\Models\Showroom;
use App\Models\User;
use EloquentFilter\ModelFilter;
use Illuminate\Support\Str;
use Spatie\Permission\Commands\Show;


class CarModelFilter extends ModelFilter
{

    public function stringUpperToLower(string $value): string
    {
        return Str::lower($value);
    }

    public function search($search)
    {
        if (isStringEnglishLetters($search)) {

            return  $this->whereRaw("LOWER(JSON_UNQUOTE(JSON_EXTRACT(name, '$.en'))) LIKE ?", ["%{$this->stringUpperToLower($search)}%"]);
        }

        if (isStringEnglishLetters($search) == false) {

            return $this->where('name','LIKE', "%{$search}%");
        }
    }

}
