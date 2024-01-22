<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\CarModel\StoreCarModelRequest;
use App\Http\Requests\Admin\CarModel\UpdateCarModelRequest;
use App\Models\CarModel;
use App\Services\CarModelService;
use App\ViewModels\CarModelViewModel;
use Illuminate\Http\Request;

class CarModelController extends Controller
{
    public $carModelService;
    
    public function __construct()
    {
        $this->carModelService = new CarModelService();
        $this->middleware('permission:car_models.read', ['only' => ['index']]);
        $this->middleware('permission:car_models.create', ['only' => ['create', 'store']]);
        $this->middleware('permission:car_models.edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:car_models.delete', ['only' => ['destroy']]);
    }
    
    public function index(Request $request)
    {
        $carModels = $this->carModelService->getData($request->all());
        return view('admin.pages.car-models.index' , get_defined_vars());
    }

    public function create()
    {
        return view('admin.pages.car-models.form' , new CarModelViewModel());
    }

    public function store(StoreCarModelRequest $storeCarModelRequest)
    {
        $this->carModelService->store($storeCarModelRequest->validated());
        Session()->flash('success' , __('Model added successfully'));
        return redirect()->back();
    }

    public function edit(CarModel $carModel)
    {
        return view('admin.pages.car-models.form' , new CarModelViewModel($carModel));
    }
    
    public function update(UpdateCarModelRequest $updateCarModelRequest , CarModel $carModel)
    {
        $this->carModelService->update($carModel, $updateCarModelRequest->validated());
        Session()->flash('success' , __('Model updated successfully'));
        return redirect()->back();
    }
    
    public function destroy(CarModel $carModel)
    {
        $this->carModelService->delete($carModel);
        Session()->flash('success' , __('Model Deleted successfully'));
        return redirect()->back();
    }
    
}
