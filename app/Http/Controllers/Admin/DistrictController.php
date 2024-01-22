<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\City\StoreCityRequest;
use App\Http\Requests\Admin\City\UpdateCityRequest;
use App\Http\Requests\Admin\District\StoreDistrictRequest;
use App\Http\Requests\Admin\District\UpdateDistrictRequest;
use App\Models\City;
use App\Models\District;
use App\Services\CityService;
use App\Services\DistrictService;
use App\ViewModels\CityViewModel;
use App\ViewModels\DistrictViewModel;
use Illuminate\Http\Request;

class DistrictController extends Controller
{
    public $districtService;
    
    public function __construct()
    {
        $this->districtService = new DistrictService();
        $this->middleware('permission:districts.read', ['only' => ['index']]);
        $this->middleware('permission:districts.create', ['only' => ['create', 'store']]);
        $this->middleware('permission:districts.edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:districts.delete', ['only' => ['destroy']]);
    }
    
    public function index(Request $request)
    {
        $districts = $this->districtService->getData($request->all());
        return view('admin.pages.district.index' , get_defined_vars());
    }

    public function create()
    {
        return view('admin.pages.district.form' , new DistrictViewModel());
    }

    public function store(StoreDistrictRequest $storeDistrictRequest)
    {
        $this->districtService->store($storeDistrictRequest->validated());
        Session()->flash('success' , __('District added successfully'));
        return redirect()->back();
    }

    public function edit(District $district)
    {
        return view('admin.pages.district.form' , new DistrictViewModel($district));
    }
    
    public function update(UpdateDistrictRequest $updateDistrictRequest , District $district){
        $this->districtService->update($district, $updateDistrictRequest->validated());
        Session()->flash('success' , __('District updated successfully'));
        return redirect()->back();
    }
    
    public function destroy(District $district){
        $this->districtService->delete($district);
        Session()->flash('success' , __('District Deleted successfully'));
        return redirect()->back();
    }
    
}
