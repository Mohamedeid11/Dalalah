<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\QueryRequest;
use App\Http\Resources\BranchResource;
use App\Http\Resources\BrandModelExtensionResource;
use App\Http\Resources\BrandModelResource;
use App\Http\Resources\BrandResource;
use App\Http\Resources\PaginationCollection;
use App\Http\Resources\ShowroomResource;
use App\Models\Branch;
use App\Models\Brand;
use App\Models\CarModel;
use App\Models\Showroom;
use App\Services\BrandService;
use App\Services\ShowRoomService;
use Illuminate\Http\Request;
use Spatie\Permission\Commands\Show;

class BrandController extends Controller
{
    private $brandService;
    
    public function __construct()
    {
        $this->brandService = new BrandService();
    }
    
    public function index(Request $request)
    {
        $brands = $this->brandService->getData($request->all());
        return $this->returnAllDataJSON(BrandResource::collection($brands) ,
            new PaginationCollection($brands));
    }

    public function getBrands()
    {
        $brands = $this->brandService->getWithoutPaginateBrands();
        return $this->returnJSON(BrandResource::collection($brands) );
    }

    public function getBrandModels($id)
    {
        $brand = Brand::findOrFail($id);
        $models = $this->brandService->getBrandModels($brand);
        return $this->returnJSON(BrandModelResource::collection($models));
    }

    public function getBrandModelExtension($id)
    {
        $carModel = CarModel::findOrFail($id);
        // $models = $this->brandService->getBrandModelExtensions($carModel);
        $models = $carModel->extensions;
        return $this->returnJSON(BrandModelExtensionResource::collection($models));
    }
}
