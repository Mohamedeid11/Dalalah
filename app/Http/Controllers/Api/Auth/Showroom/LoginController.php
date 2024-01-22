<?php

namespace App\Http\Controllers\Api\Auth\Showroom;

use App\Http\Controllers\Api\ApiController;
use App\Http\Requests\Api\Showroom\ShowroomLoginRequest;
use App\Http\Resources\ShowroomResource;
use App\Models\Showroom;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class LoginController extends ApiController
{

    public function login(ShowroomLoginRequest $showroomLoginRequest)
    {
        $ShowRoom = Showroom::where('code',$showroomLoginRequest->code)->first();
        if (empty($ShowRoom) || !Hash::check($showroomLoginRequest->password, $ShowRoom->password)) {
            return $this->returnWrong(__('mobileValidation.wrong_password'),422);
        }

        $ShowRoom->update(['fcm_token' => $showroomLoginRequest->fcm_token]);
        // $token = $ShowRoom->createToken(uniqid())->accessToken;
        return $this->returnJSON( new ShowroomResource($ShowRoom) );
    }

    public function logout()
    {
        $user = Auth::guard('showroom-api')->user()->token();
        $user->revoke();
        return $this->returnSuccess();
    }

}
