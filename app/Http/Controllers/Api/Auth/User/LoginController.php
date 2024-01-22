<?php

namespace App\Http\Controllers\Api\Auth\User;

use App\Http\Controllers\Api\ApiController;
use App\Http\Requests\Api\Auth\User\LoginRequest;
use App\Http\Resources\EndUserResource;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class LoginController extends ApiController
{

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    public function login(LoginRequest $loginRequest)
    {
        $endUser = User::where('email',$loginRequest->email)->first();

        if (empty($endUser) || !Hash::check($loginRequest->password, $endUser->password)) {
            return $this->returnWrong(__('mobileValidation.wrong_password'),422);
        }

        $endUser->update(['fcm_token' => $loginRequest->fcm_token]);
        return $this->returnJSON( new EndUserResource($endUser) );
    }

    public function logout()
    {
        $user = Auth::guard('end-user-api')->user()->token();
        $user->revoke();
        return $this->returnSuccess();
    }

}
