<?php

namespace App\Http\Controllers\EndUser\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\EndUser\Auth\LoginRequest;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
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

    public function form()
    {
        return view('end-user.auth.login'); 
    }

    public function login(LoginRequest $loginRequest)
    { 
        if (Auth::guard('end-user')->attempt(['email'=> $loginRequest->email , 'password' => $loginRequest->password])) {
            $loginRequest->session()->regenerate();
            return redirect()->intended('profile/dashboard');
        }
        return back()->withErrors([
            'email' => 'The provided credentials do not match our records.',
        ])->onlyInput('email');   
    }

    protected function logout(Request $request)
    {
        Auth::guard('end-user')->logout();
        return redirect('/');
    }

}
