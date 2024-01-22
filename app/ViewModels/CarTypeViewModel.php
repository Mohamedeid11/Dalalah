<?php

namespace App\ViewModels;

use App\Http\Controllers\Admin\CarTypeController;
use App\Models\CarType;
use Spatie\ViewModels\ViewModel;

class CarTypeViewModel extends ViewModel
{
        
    public function __construct(public ?CarType $carType = null)
    {
        $this->carType = is_null($carType) ? new CarType(old()) : $carType;
    }

    public function action(): string
    {
        return is_null($this->carType->id)
            ? route('admin.car_type.store')
            : route('admin.car_type.update', ['car_type' => $this->carType->id]);
    }

    public function method(): string
    {
        return is_null($this->carType->id) ? 'POST' : 'PUT';
    }
    
}
