<?php

namespace App\ViewModels;

use App\Models\Brand;
use App\Models\City;
use App\Models\District;
use App\Models\Package;
use App\Models\Showroom;
use Spatie\ViewModels\ViewModel;

class ShowRoomViewModel extends ViewModel
{
    public $packages;
    public $cities;
    public $districts;

    public function __construct(public ?Showroom $showroom = null)
    {
        $this->showroom = is_null($showroom) ? new Showroom(old()) : $showroom;
        $this->packages = Package::get();
        $this->cities   = City::get();
        $this->districts = District::get();
    }

    public function action(): string
    {
        return is_null($this->showroom->id)
            ? route('admin.showroom.store')
            : route('admin.showroom.update', ['showroom' => $this->showroom->id]);
    }

    public function method(): string
    {
        return is_null($this->showroom->id) ? 'POST' : 'PUT';
    }

}
