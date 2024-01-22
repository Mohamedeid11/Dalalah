<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\QueryRequest;
use App\Http\Resources\BranchResource;
use App\Http\Resources\BrandModelExtensionResource;
use App\Http\Resources\BrandModelResource;
use App\Http\Resources\BrandResource;
use App\Http\Resources\ColorResource;
use App\Http\Resources\PaginationCollection;
use App\Http\Resources\ShowroomResource;
use App\Models\Branch;
use App\Models\Brand;
use App\Models\CarModel;
use App\Models\Showroom;
use App\Services\BrandService;
use App\Services\ColorService;
use App\Services\ShowRoomService;
use Illuminate\Http\Request;
use Spatie\Permission\Commands\Show;

class ColorController extends Controller
{
    private $colorService;
    
    public function __construct()
    {
        $this->colorService = new ColorService();
    }
    
    public function index(Request $request)
    {
        $colors = $this->colorService->getData($request->all());
        return $this->returnAllDataJSON(ColorResource::collection($colors) ,
            new PaginationCollection($colors));
    }
    
}
