<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Brand\StoreBrandRequest;
use App\Http\Requests\Admin\Brand\UpdateBrandRequest;
use App\Models\Brand;
use App\Models\CarModel;
use App\Services\BrandService;
use App\ViewModels\BrandViewModel;
use Illuminate\Http\Request;

class BrandController extends Controller
{
    public $brandService;
    
    public function __construct()
    {
        $this->brandService = new BrandService();
        $this->middleware('permission:brands.read', ['only' => ['index']]);
        $this->middleware('permission:brands.create', ['only' => ['create', 'store']]);
        $this->middleware('permission:brands.edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:brands.delete', ['only' => ['destroy']]);
    }
    
    public function index(Request $request)
    {
        $brands = $this->brandService->getData($request->all());
        return view('admin.pages.brands.index' , get_defined_vars());
    }

    public function create()
    {
        return view('admin.pages.brands.form' , new BrandViewModel());
    }

    public function store(StoreBrandRequest $storeBrandRequest)
    {
        $this->brandService->store($storeBrandRequest->validated());
        Session()->flash('success' , __('brand added successfully'));
        return redirect()->back();
    }

    public function edit(Brand $brand)
    {
        return view('admin.pages.brands.form' , new BrandViewModel($brand));
    }
    
    public function update(UpdateBrandRequest $updateBrandRequest , Brand $brand){
        $this->brandService->update($brand, $updateBrandRequest->validated());
        Session()->flash('success' , __('brand updated successfully'));
        return redirect()->back();
    }
    
    public function destroy(Brand $brand){
        $this->brandService->delete($brand);
        Session()->flash('success' , __('brand Deleted successfully'));
        return redirect()->back();
    }

    public function getBrandModels(Request $request)
    {
        $brand = Brand::where('id',$request->value)->first();
        $models = $this->brandService->getBrandModels($brand);
        if($models){
            return response()->json(['data' => $models]);
        }
    }

    public function getBrandModelExtension(Request $request)
    {
        $carModel = CarModel::where('id',$request->value)->first();
        $models = $this->brandService->getBrandModelExtensions($carModel);
        if($models){
            return response()->json(['data' => $models]);
        }
    }
    
}
