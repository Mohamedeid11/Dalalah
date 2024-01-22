<?php

namespace App\ViewModels;

use App\Models\Brand;
use App\Models\City;
use Spatie\ViewModels\ViewModel;

class CityViewModel extends ViewModel
{
        
    public function __construct(public ?City $city = null)
    {
        $this->city = is_null($city) ? new City(old()) : $city;
    }

    public function action(): string
    {
        return is_null($this->city->id)
            ? route('admin.city.store')
            : route('admin.city.update', ['city' => $this->city->id]);
    }

    public function method(): string
    {
        return is_null($this->city->id) ? 'POST' : 'PUT';
    }
    
}
