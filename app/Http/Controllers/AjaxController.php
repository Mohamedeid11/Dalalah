<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use App\Models\CarModel;
use App\Models\District;
use App\Services\BrandService;
use Illuminate\Http\Request;


class AjaxController extends Controller
{
    public $brandService;
    
    public function __construct()
    {
        $this->brandService = new BrandService();
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
        // $models = $this->brandService->getBrandModelExtensions($carModel);
        $models = $carModel->extensions;
        if($models){
            return response()->json(['data' => $models]);
        }
    }

    public function getDistricts(Request $request)
    {
        $districts = District::where('city_id',$request->value)->get();
        if($districts){
            return response()->json(['data' => $districts]);
        }
    }
    
}
