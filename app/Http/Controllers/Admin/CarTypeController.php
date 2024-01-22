<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\CarType\StoreCarTypeRequest;
use App\Http\Requests\Admin\CarType\UpdateCarTypeRequest;
use App\Models\CarType;
use App\Services\CarTypeService;
use App\ViewModels\CarTypeViewModel;
use Illuminate\Http\Request;


class CarTypeController extends Controller
{
    public $carTypeService;
    
    public function __construct()
    {
        $this->carTypeService = new CarTypeService();
        $this->middleware('permission:car_types.read', ['only' => ['index']]);
        $this->middleware('permission:car_types.create', ['only' => ['create', 'store']]);
        $this->middleware('permission:car_types.edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:car_types.delete', ['only' => ['destroy']]);
    }
    
    public function index(Request $request)
    {
        $carTypes = $this->carTypeService->getData($request->all());
        return view('admin.pages.car_types.index' , get_defined_vars());
    }

    public function create()
    {
        return view('admin.pages.car_types.form' , new CarTypeViewModel());
    }

    public function store(StoreCarTypeRequest $storeCarTypeRequest)
    {
        $this->carTypeService->store($storeCarTypeRequest->all());
        Session()->flash('success' , __('Car Type added successfully'));
        return redirect()->back();
    }

    public function edit(CarType $carType)
    {
        return view('admin.pages.car_types.form' , new CarTypeViewModel($carType));
    }
    
    public function update(UpdateCarTypeRequest $updateCarTypeRequest ,CarType $carType)
    {
        $this->carTypeService->update($carType, $updateCarTypeRequest->all());
        Session()->flash('success' , __('Car Type updated successfully'));
        return redirect()->back();
    }
    
    public function destroy(CarType $carType)
    {   
        if(count($carType->cars)){
            Session()->flash('error' , __('Cannot Delete Car Type has Cars'));
        }else
        {
            $this->carTypeService->delete($carType);
            Session()->flash('success' , __('Car Type Deleted successfully'));
        }
        return redirect()->back();
    }
    
}
