<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\ApiController;
use App\Http\Requests\Api\Restaurant\ChangeHasDeliveryRequest;
use App\Http\Requests\Api\Restaurant\ChangeOnlineRequest;
use App\Http\Requests\Api\Restaurant\UpdateRequest;
use App\Http\Resources\MenuResource;
use App\Http\Resources\PaginationCollection;
use App\Http\Resources\ProductResource;
use App\Http\Resources\RestaurantResource;
use App\Http\Resources\SliderResource;
use App\Models\Product;
use App\Models\Restaurant\Restaurant;
use App\Services\RestaurantService;
use App\Services\SliderService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class SliderController extends ApiController
{
    private $sliderService; 
    
    public function __construct()
    {
        $this->sliderService = new SliderService();
    }
    
    // GET ALL RESTAURANT
    public function index(Request $request)
    {
        $sliders = $this->sliderService->getData($request->all() , $request->limit ?? 15);
        return $this->returnAllDataJSON(SliderResource::collection($sliders) ,
         new PaginationCollection($sliders));
    }
    
}
