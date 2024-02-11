<?php

namespace App\Http\Controllers\Api\Auth\Showroom;

use App\Http\Controllers\Api\ApiController;
use App\Http\Requests\Api\Showroom\ShowroomEditProfileRequest;
use App\Http\Requests\Api\Showroom\ShowroomLoginRequest;
use App\Http\Requests\Api\Showroom\ShowroomRegisterRequest;
use App\Http\Resources\EndUserResource;
use App\Http\Resources\ShowroomResource;
use App\Mail\EmailVerification;
use App\Models\Showroom;
use App\Services\ShowRoomService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;

class ShowroomProfileController extends ApiController
{
    private $showroomService;

    public function __construct()
    {
        $this->showroomService = new ShowRoomService() ;
    }


    public function create(ShowroomRegisterRequest $request)
    {
        $data = [
            'showroom_name' => [
                'en' => $request->name_en,
                'ar' => $request->name_ar,
                ],
            'owner_name' => [
                'en' => $request->owner_name_en,
                'ar' => $request->owner_name_ar,
                ],
            'description' => [
                'en' => $request->description_en,
                'ar' => $request->description_ar,
                ],
            'email'         =>$request->email,
            'password'      =>$request->password,
            'phone'         =>$request->phone,
            'whatsapp'      =>$request->whatsapp,
            'city_id'       =>$request->city_id,
            'district_id'   =>$request->district_id,
            'logo'          =>$request->logo,
            'cover_image'   =>$request->cover_image,
        ];

        $showroom = $this->showroomService->store($data);
//        Mail::to($showroom->email)->send(new EmailVerification($showroom , 'showroom'));

        return $this->returnJSON(new ShowroomResource($showroom),true, 200 ,__('site.registered_successfully_code_is') . $showroom->code);

    }

    public function getShowroom()
    {
       $showroom = auth('showroom-api')->user();
       return $this->returnJSON(new ShowroomResource($showroom));
    }

    public function editShowroom(ShowroomEditProfileRequest $request)
    {
        $data = [
            'showroom_name' => [
                'en' => $request->name_en,
                'ar' => $request->name_ar,
            ],
            'owner_name' => [
                'en' => $request->owner_name_en,
                'ar' => $request->owner_name_ar,
            ],
            'description' => [
                'en' => $request->description_en,
                'ar' => $request->description_ar,
            ],
            'email'         => $request->email,
            'password'      =>$request->password,
            'phone'         =>$request->phone,
            'whatsapp'      =>$request->whatsapp,
            'city_id'       =>$request->city_id,
            'district_id'   =>$request->district_id,
            'logo'          =>$request->logo,
            'cover_image'   =>$request->cover_image,
            'tax_card'      =>$request->tax_card,
            'commercial'    =>$request->commercial,
        ];

        $showroom = $this->showroomService->update(auth('showroom-api')->user() ,$data);
        return $this->returnJSON(new ShowroomResource($showroom),true, 200 ,$showroom->name . __(' Updated Successfully'));
    }

    public function updateProfileImage(Request $request)
    {
        $showroom = auth('showroom-api')->user();
        if($request->has('image')){
            $this->showroomService->update($showroom ,$request->all('image'));
        }
        return $this->returnJSON(new ShowroomResource($showroom));
    }

}
