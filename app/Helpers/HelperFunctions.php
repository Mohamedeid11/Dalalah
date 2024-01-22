<?php

use App\Models\Setting;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Route;


if (!function_exists('setting'))
{
    function setting($value ,$lang = null)
    {
        $lang     =  $lang == null ? app()->getLocale() : $lang;
        $settings = Cache::get('settings') == null ?
                            Cache::rememberForever('settings', function () {
                                    return Setting::get();
                                })
                             : Cache::get('settings');

        if($settings != null){
            foreach($settings as $setting){
                if($setting->option == $value){
                    return $setting->getTranslation('value',$lang);
                }
            }
        }
        return '';
    }
}

if (!function_exists('gender'))
{
    function gender()
    {
        return [
            'male'       => 'ذكر',
            'female'     => 'انثى',
        ];
    }
}

if (!function_exists('isStringEnglishLetters'))
{
    function isStringEnglishLetters(string $string): bool
    {
        $string = preg_replace('/\s/u', '', $string);
        return ! preg_match('/[^A-Za-z0-9]/', $string);
    }
}

if (!function_exists('socialMedia'))
{
    function socialMedia()
    {
       return [
            'facebook-f'    =>  setting('facebook','en'),
            'twitter'       =>  setting('twitter','en'),
            'instagram'     => setting('instagram','en') ,
            'telegram'      => setting('telegram','en') ,
            // 'youtube'       => setting('youtube','en') ,
            'tiktok'        => setting('tiktok','en') ,
            'snapchat'      => setting('snapchat','en') ,
        ];
    }
}

if (!function_exists('showLink'))
{
    function showLink(string $routeName)
    {
       return  Route::is("{$routeName}.*") ? 'show' : '';
    }
}

if (!function_exists('activeLink'))
{
    function activeLink(string $routeName)
    {
       return  Route::is("{$routeName}.*") ? 'active' : '';
    }
}

if (!function_exists('activeSingleLink'))
{
    function activeSingleLink(string $routeName)
    {
       return  Route::is("{$routeName}") ? 'active' : '';
    }
}

if (!function_exists('getLastKeyRoute'))
{
    function getLastKeyRoute(string $routeName)
    {
       $array = explode('.',$routeName);
       return end($array);
    }
}

if(!function_exists('showroomType'))
{
    function showroomType()
    {
        return [
            'showroom' => __('showroom'),
            'agency'   => __('agency'),
        ];
    }
}

if(!function_exists('routeShowRoomPrefix'))
{
    function routeShowRoomPrefix(){
        if(Auth::guard('showroom')->user() != ''){
           return  Auth::guard('showroom')->user()->type ;
        }
        return '';
    }
}

if(!function_exists('getDriveTypes'))
{
    function getDriveTypes(){
        return [
                (object) [
                    'key'  => 'manual',
                    'name' => __('global.manual')
                    ] ,
                (object) [
                        'key'  => 'automatic',
                        'name' => __('global.automatic')
                    ],
            ];
    }
}

if(!function_exists('getBodyTypes'))
{
    function getBodyTypes(){
        return [
              (object) [
                  'key'  => 'hatchback',
                'name' => __('global.hatchback')] ,
              (object) [
                    'key'  => 'sedan',
                    'name' => __('global.sedan')] ,
            ];
    }
}

if(!function_exists('getFuelTypes'))
{
    function getFuelTypes(){
        return [
            (object) [
            'key'  => 'gasoline',
            'name' => __('global.gasoline')] ,
            (object) [
            'key'  => 'diesel',
            'name' => __('global.diesel')] ,
            (object) [
            'key'  => 'electrical',
            'name' => __('global.electrical')] ,
            (object) [
            'key'  => 'hybrid',
            'name' => __('global.hybrid')] ,
        ];
    }
}

if(!function_exists('getCarStatus'))
{
    function getCarStatus(){
        return [
            (object) [
            'key'  => 'new',
            'name' => __('global.new')] ,
            (object) [
                'key'  => 'used',
                'name' => __('global.used')] ,
        ];
    }
}

if(!function_exists('getCarStatusUsed'))
{
    function getCarStatusUsed(){
        return [
            (object) [
                'key'  => 'used',
                'name' => __('global.used')] ,
        ];
    }
}

if(!function_exists('getCarStatusNew'))
{
    function getCarStatusNew(){
        return [
             (object) [
            'key'  => 'new',
            'name' => __('global.new')] ,
        ];
    }
}

if(!function_exists('getActiveUserName'))
{
    function getActiveUserName()
    {
        $data  = [];
        if(auth('end-user')->check()){
            $data['name'] = auth('end-user')->user()->name;
            $data['email'] = auth('end-user')->user()->email;
            $data['logo'] = auth('end-user')->user()->getLogo();
        }
        return $data ;
    }
}
