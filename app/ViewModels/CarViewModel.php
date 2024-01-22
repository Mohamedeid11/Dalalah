<?php

namespace App\ViewModels;

use App\Models\Brand;
use App\Models\Car;
use App\Models\CarType;
use App\Models\Color;
use App\Models\Feature;
use Carbon\Carbon;
use Spatie\ViewModels\ViewModel;


class CarViewModel extends ViewModel
{
    public $brands;
    public $years;
    public $features;
    public $colors;
    public $carTypes;

    public function __construct(public ?Car $car = null)
    {
        $this->car = is_null($car) ? new Car(old()) : $car;
        $this->brands     =  Brand::get();
        $this->colors     =  Color::get();
        $this->years      =  range(Carbon::now()->addYear(5)->year, 1990);
        $this->features   =  Feature::with('options')->get();
        $this->carTypes   =  CarType::get();
    }

    public function action(): string
    {
        return is_null($this->car->id)
            ? route('admin.car.store')
            : route('admin.car.update', ['car' => $this->car->id]);
    }

    public function method(): string
    {
        return is_null($this->car->id) ? 'POST' : 'PUT';
    }

}
