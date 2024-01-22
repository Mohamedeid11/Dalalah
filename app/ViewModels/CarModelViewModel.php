<?php

namespace App\ViewModels;

use App\Models\Brand;
use App\Models\CarModel;
use Carbon\Carbon;
use Spatie\ViewModels\ViewModel;


class CarModelViewModel extends ViewModel
{
    public $brands;
    public $years;

    public function __construct(public ?CarModel $carModel = null)
    {
        $this->carModel = is_null($carModel) ? new CarModel(old()) : $carModel;
        $this->brands = Brand::get();
        $this->years      =  range(Carbon::now()->addYear(5)->year, 1990);
    }

    public function action(): string
    {
        return is_null($this->carModel->id)
            ? route('admin.car-models.store')
            : route('admin.car-models.update', ['car_model' => $this->carModel->id]);
    }

    public function method(): string
    {
        return is_null($this->carModel->id) ? 'POST' : 'PUT';
    }
}
