<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Jenssegers\Agent\Facades\Agent;


class DeviceRedirectMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        if (Agent::isAndroidOS()) {
            return redirect()->away('https://play.google.com/store/apps/details?id=com.dalalah');
        } elseif (Agent::is('iPhone') || Agent::is('iPad')) {
            return redirect()->away('https://apps.apple.com/us/app/dalalah-%D8%AF%D9%84%D8%A7%D9%84%D8%A9/id6475810704');
        }

        return $next($request);    }
}
