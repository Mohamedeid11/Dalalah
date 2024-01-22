<?php

namespace App\Http\Controllers\EndUser\Auth;

use App\Http\Controllers\Controller;

use App\Http\Requests\EndUser\Auth\RegisterRequest;
use App\Services\EndUserService;
use App\Traits\ApiHelperTrait;
use Illuminate\Support\Facades\Auth;

class RegisterController extends Controller
{
    private $endUserService;
    
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->endUserService = new EndUserService();
    }

    public function form()
    {
       return view('end-user.auth.register'); 
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
        $registerRequest->session()->regenerate();
        Auth::guard('end-user')->login($endUser);
        return redirect()->route('end-user.profile.dashboard');
    }
    
}
