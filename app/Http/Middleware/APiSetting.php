<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class APiSetting
{
    
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next)
    {
        $defaultLang = 'en'; // depend on the app

        $lang = $request->header('Accept-Language');

        if (empty($lang) || !in_array($lang, ['en', 'ar'])) {
            app()->setLocale($defaultLang);
        } else {
            app()->setLocale($lang);
        }
        return $next($request);
    }
    
}
