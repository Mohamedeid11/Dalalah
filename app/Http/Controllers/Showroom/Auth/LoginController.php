<?php

namespace App\Http\Controllers\Showroom\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\EndUser\Auth\EndUserLoginRequest;
use App\Http\Requests\Showroom\Auth\ShowroomLoginRequest;
use App\Models\Showroom;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class LoginController extends Controller
{
    
    public function form()
    {
        return view('showroom.auth.login');
    }

    
    public function action(ShowroomLoginRequest $showRoomLoginRequest)
    {
        $showroom = Showroom::where('code' , $showRoomLoginRequest->code)->first();
      
        $credentials = $showRoomLoginRequest->only('code', 'password');
        if (Auth::guard('showroom')->attempt($credentials)) {
            return redirect()->intended(app()->getLocale()."/showroom/profile/dashboard");
        }else{
            session()->flash('error' , "data Not Correct");
            return back();
        }
    }

    protected function logout(Request $request)
    {
        Auth::guard('showroom')->logout();
        return redirect('/');
    }
    
}
