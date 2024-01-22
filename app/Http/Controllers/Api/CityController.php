<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\City\StoreCityRequest;
use App\Http\Requests\Admin\City\UpdateCityRequest;
use App\Models\City;
use App\Services\CityService;
use App\ViewModels\CityViewModel;
use Illuminate\Http\Request;

class CityController extends Controller
{
    public $cityService;
    
    public function __construct()
    {
        $this->cityService = new CityService();
    }
    
    public function index(Request $request)
    {
        $cities = $this->cityService->getData($request->all());
        return view('admin.pages.city.index' , get_defined_vars());
    }
    
}
