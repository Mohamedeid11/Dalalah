<?php

namespace App\Http\Controllers\Admin;

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
        $this->middleware('permission:cities.read', ['only' => ['index']]);
        $this->middleware('permission:cities.create', ['only' => ['create', 'store']]);
        $this->middleware('permission:cities.edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:cities.delete', ['only' => ['destroy']]);
    }
    
    public function index(Request $request)
    {
        $cities = $this->cityService->getData($request->all());
        return view('admin.pages.city.index' , get_defined_vars());
    }

    public function create()
    {
        return view('admin.pages.city.form' , new CityViewModel());
    }

    public function store(StoreCityRequest $storeCityRequest)
    {
        $this->cityService->store($storeCityRequest->validated());
        Session()->flash('success' , __('City added successfully'));
        return redirect()->back();
    }

    public function edit(City $city)
    {
        return view('admin.pages.city.form' , new CityViewModel($city));
    }
    
    public function update(UpdateCityRequest $updateCityRequest , City $city){
        $this->cityService->update($city, $updateCityRequest->validated());
        Session()->flash('success' , __('City updated successfully'));
        return redirect()->back();
    }
    
    public function destroy(City $city){
        $this->cityService->delete($city);
        Session()->flash('success' , __('City Deleted successfully'));
        return redirect()->back();
    }
    
}
