<?php

namespace App\ViewModels;

use App\Models\City;
use App\Models\District;
use Carbon\Carbon;
use Spatie\ViewModels\ViewModel;


class DistrictViewModel extends ViewModel
{
    public $cities;
    
    public function __construct(public ?District $district = null)
    {
        $this->district = is_null($district) ? new District(old()) : $district;
        $this->cities = City::get();
    }

    public function action(): string
    {
        return is_null($this->district->id)
            ? route('admin.district.store')
            : route('admin.district.update', ['district' => $this->district->id]);
    }

    public function method(): string
    {
        return is_null($this->district->id) ? 'POST' : 'PUT';
    }   
}
