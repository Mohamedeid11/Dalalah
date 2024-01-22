<?php

namespace App\ViewModels;

use App\Models\Brand;
use App\Models\CarModel;
use App\Models\CarType;
use App\Models\Request;

use Carbon\Carbon;
use Spatie\ViewModels\ViewModel;


class RequestViewModel extends ViewModel
{
    public $carTypes;
    public function __construct(public ?Request $request = null)
    {
        $this->request   = is_null($request) ? new Request(old()) : $request;
        $this->carTypes  = CarType::get();
    }

    public function action(): string
    {
        return is_null($this->carModel->id)
            ? route('admin.requests.store')
            : route('admin.requests.update', ['request' => $this->request->id]);
    }

    public function method(): string
    {
        return is_null($this->request->id) ? 'POST' : 'PUT';
    }   
    
}
