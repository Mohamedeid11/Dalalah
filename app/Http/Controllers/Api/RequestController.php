<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Request\StoreRequestPriceRequest;
use App\Http\Requests\Api\Request\StoreRequestRequest;
use App\Http\Requests\Api\Request\TrackRequestRequest;
use App\Http\Resources\PaginationCollection;
use App\Http\Resources\RequestPriceResource;
use App\Models\Car;
use App\Models\Request as ModelsRequest;
use App\Models\RequestPrice;
use App\Services\RequestService;

class RequestController extends Controller
{
    private $requestService;

    public function __construct()
    {
        $this->requestService = new RequestService();
    }

    public function store(StoreRequestRequest $storeRequestRequest)
    {
        $this->requestService->store($storeRequestRequest->validated());
        return $this->returnSuccess();
    }

    public function trackRequest(TrackRequestRequest $trackRequestRequest){
        $request = ModelsRequest::where('phone' , $trackRequestRequest->phone)->orderBy('id','desc')->first();
        if($request){
            return $this->returnJSON([
                'name'         => $request->name,
                'phone'        => $request->phone,
                'is_approved'  => $request->is_approved  == 0 ? 'pending' : 'approved',
            ]);
        }
        return $this->returnWrong();
    }

    public function priceRequest(Car $car){

        $price_request = RequestPrice::create([
            'user_id' => auth('end-user-api')->user()->id,
            'car_id' => $car->id,
            'showroom_id' => $car->showroom->id,
        ]);

        return $this->returnJSON(new RequestPriceResource($price_request), true, '200', __('site.request_sent_successfully'));
    }

    public function getpriceRequest(){

        $price_request = RequestPrice::paginate(15);
        return $this->returnAllDataJSON(RequestPriceResource::collection($price_request) , new PaginationCollection($price_request));

    }

}
