<?php

namespace App\Http\Middleware;

use App\Models\Showroom;
use App\Models\User;
use App\Traits\ApiHelperTrait;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class BlockUserMobileApp
{ 
    use ApiHelperTrait;
    
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
    */
    public function handle(Request $request, Closure $next): Response
    {
        // dd(Auth::guard('showroom-api')->check() , Auth::guard('end-user-api')->check());
        
        if (Auth::guard('showroom-api')->check() && Auth::guard('showroom-api')->user()->isBlocked()) {
            return $this->returnWrong(__('Sorry, you are blocked!'),403);
        }elseif (Auth::guard('end-user-api')->check() && Auth::guard('end-user-api')->user()->isBlocked()) {
            return $this->returnWrong(__('Sorry, you are blocked!'),403);
        }
      
        $user = User::whereEmail($request->email)->first();
        if ($user !== null && $user->isBlocked()) {
            return $this->returnWrong(__('Sorry, you are blocked!'),403);
        }

        $showroom = Showroom::whereCode($request->code)->first();
        if ($showroom !== null && $showroom->isBlocked()) {
            return $this->returnWrong(__('Sorry, you are blocked!'),403);
        }
        
        return $next($request);
    }
    
}
