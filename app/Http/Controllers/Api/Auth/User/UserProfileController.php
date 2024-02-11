<?php

namespace App\Http\Controllers\Api\Auth\User;

use App\Http\Controllers\Api\ApiController;
use App\Http\Requests\Api\Auth\User\UserEditProfileRequest;
use App\Http\Requests\Api\Car\CheckCarRequest;
use App\Http\Requests\Api\Showroom\ShowroomLoginRequest;
use App\Http\Resources\CarPlateResource;
use App\Http\Resources\CarResource;
use App\Http\Resources\EndUserResource;
use App\Http\Resources\PaginationCollection;
use App\Http\Resources\ShowroomResource;
use App\Models\Showroom;
use App\Services\EndUserService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserProfileController extends ApiController
{
    private $userService;

    public function __construct()
    {
        $this->userService = new EndUserService();
    }

    public function getUser()
    {
       $user = auth('end-user-api')->user();
       return $this->returnJSON(new EndUserResource($user));
    }

    public function editUser(UserEditProfileRequest $userEditProfileRequest)
    {
        $user = auth('end-user-api')->user();
        $this->userService->update($user ,$userEditProfileRequest->validated());
        return $this->returnJSON(new EndUserResource($user),true, 200 ,$user->name . __(' Updated Successfully'));
    }

    public function updateProfileImage(Request $request)
    {
        $user = auth('end-user-api')->user();
        if($request->has('image')){
            $this->userService->update($user ,$request->all('image'));
        }
        return $this->returnJSON(new EndUserResource($user));
    }

    // GET Favorite Cars
    public function getEndUserFavorite()
    {
        $user = auth('end-user-api')->user();
        $favoriteCars = $user->favorites()->orderBy('id','DESC')->paginate();
        return $this->returnAllDataJSON( CarResource::collection($favoriteCars),
            new PaginationCollection($favoriteCars));
    }

    // GET Favorite Plates
    public function getEndUserFavoritePlates()
    {
        $user = auth('end-user-api')->user();
        $favoritePlates = $user->favoritPLates()->orderBy('id','DESC')->paginate();
        return $this->returnAllDataJSON( CarPlateResource::collection($favoritePlates),
            new PaginationCollection($favoritePlates));
    }

    // Add or delete Favorite
    public function addOrDeleteFavorite(CheckCarRequest $request)
    {
       $user = auth('end-user-api')->user();
        if (isset($request->car_id)){

            $favoriteCars = $user->favorites()->pluck('favorites.car_id')->toArray();
            if(!in_array($request->car_id , $favoriteCars)){
                $user->favorites()->attach($request->car_id);
                return $this->returnSuccess(__('mobileValidation.add_to_favorite_Successfully'));
            }else{
                $user->favorites()->detach($request->car_id);
                return $this->returnSuccess(__('mobileValidation.remove_from_favorite_Successfully'));
            }
        }elseif(isset($request->plate_id)){

            $favoriteplates = $user->favoritPLates()->pluck('favorites.plate_id')->toArray();
            if(!in_array($request->plate_id , $favoriteplates)){
                $user->favoritPLates()->attach($request->plate_id);
                return $this->returnSuccess(__('mobileValidation.add_to_favorite_Successfully'));
            }else{
                $user->favoritPLates()->detach($request->plate_id);
                return $this->returnSuccess(__('mobileValidation.remove_from_favorite_Successfully'));
            }
        }

    }

}
