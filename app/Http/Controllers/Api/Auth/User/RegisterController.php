<?php

namespace App\Http\Controllers\Api\Auth\User;

use App\Http\Controllers\Api\ApiController;
use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Auth\User\RegisterRequest;
use App\Http\Resources\EndUserResource;
use App\Http\Resources\JobUserResource;
use App\Mail\EmailVerification;
use App\Services\EndUserService;
use App\Traits\ApiHelperTrait;
use Illuminate\Support\Facades\Mail;

class RegisterController extends ApiController
{
    private $endUserService;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->endUserService  = new EndUserService();
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\Models\User
     */
    protected function create(RegisterRequest $registerRequest)
    {
        $endUser = $this->endUserService->store($registerRequest->validated());
        $endUser->update(['fcm_token' => $registerRequest->fcm_token]);

        Mail::to($endUser->email)->send(new EmailVerification($endUser , 'end-user'));

        return $this->returnJSON(new EndUserResource($endUser) ,true,200,__('site.registered_successfully'));
    }

}
