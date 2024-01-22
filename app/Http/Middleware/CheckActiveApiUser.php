<?php

namespace App\Http\Middleware;

use App\Traits\ApiHelperTrait;
use Closure;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class CheckActiveApiUser
{
    use ApiHelperTrait;
    
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        if(auth('showroom-api')->check()  || auth('end-user-api')->check()){
            return $next($request);
        }
        return $this->returnWrong('غير مصرح لك بالدخول', JsonResponse::HTTP_UNAUTHORIZED);
    }
    
}
