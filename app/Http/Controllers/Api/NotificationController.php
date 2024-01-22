<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\ApiController;
use App\Http\Requests\Api\Restaurant\ChangeHasDeliveryRequest;
use App\Http\Requests\Api\Restaurant\ChangeOnlineRequest;
use App\Http\Requests\Api\Restaurant\UpdateRequest;
use App\Http\Resources\generalNotificationResource;
use App\Http\Resources\MenuResource;
use App\Http\Resources\PaginationCollection;
use App\Http\Resources\ProductResource;
use App\Http\Resources\RestaurantResource;
use App\Http\Resources\SliderResource;
use App\Models\Product;
use App\Models\Restaurant\Restaurant;
use App\Services\PushNotificationService;
use App\Services\RestaurantService;
use App\Services\SliderService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;


class NotificationController extends ApiController
{
    private $notificationService; 
    
    public function __construct()
    {
        $this->notificationService = new PushNotificationService();
    }
    
    // GET ALL General Notifications
    public function index(Request $request)
    {    
        if (Auth::guard('showroom-api')->check()) {
            $notifications = $this->notificationService->getMobileShowroomData($request->limit ?? 15);
        } 
        elseif (Auth::guard('end-user-api')->check()) {
            $notifications = $this->notificationService->getMobileUserData($request->limit ?? 15);
        }
        return $this->returnAllDataJSON(generalNotificationResource::collection($notifications) ,
         new PaginationCollection($notifications));
    }
    
}
