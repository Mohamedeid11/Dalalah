<?php

namespace App\Services;

use App\Models\Notification;
use App\Models\Showroom;
use App\Models\Slider;
use App\Models\User;
use App\Notifications\GeneralNotification;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Notification as FacadesNotification;

class PushNotificationService {

    public function getData(array $data ,int $paginate = 15)
    {
        return  Notification::orderBy('id','desc')->paginate($paginate);
    }

    public function store(array $data)
    {
        $users         =  user::whereNotNull('fcm_token')->get();
        $allShowrooms  =  Showroom::whereNotNull('fcm_token')->get();
        $showrooms     =  Showroom::where('type','showroom')->whereNotNull('fcm_token')->get();
        $agencies      =  Showroom::where('type','agency')->whereNotNull('fcm_token')->get();

        $showrooms_new_cars   = Showroom::whereNotNull('fcm_token')->whereHas('cars' , function ($query){
            $query->where('status' , 'new');
        })->get();

        $showrooms_used_cars   = Showroom::whereNotNull('fcm_token')->whereHas('cars' , function ($query){
            $query->where('status' , 'used');
        })->get();

        $users_used_cars   = User::whereNotNull('fcm_token')->whereHas('cars' , function ($query){
            $query->where('status' , 'used');
        })->get();

        if($data['clients'] == 'all'){
            $data['role'] = 'users';
            FacadesNotification::send($users, new  GeneralNotification($data));
            $data['role'] = 'showrooms';
            FacadesNotification::send($showrooms , new  GeneralNotification($data));
            $data['role'] = 'agencies';
            FacadesNotification::send($agencies , new  GeneralNotification($data));
            if(count($users)){
                Firebase::send($data['title'],$data['message'],$users->pluck('id')->toArray() , 'user',['type'=>'general']);
            }
            if(count($allShowrooms)){
                Firebase::send($data['title'],$data['message'],$allShowrooms->pluck('id')->toArray() , 'showroom',['type'=>'general']);
            }
        }
        elseif($data['clients'] == 'users'){
            if(count($users)){
                $data['role'] = 'users';
                FacadesNotification::send($users, new  GeneralNotification($data));
                Firebase::send($data['title'],$data['message'],$users->pluck('id')->toArray() , 'user',['type'=>'general']);
            }
        }
        elseif($data['clients'] == 'agencies'){
            if(count($agencies)){
                $data['role'] = 'agencies';
                FacadesNotification::send($agencies , new  GeneralNotification($data));
                Firebase::send($data['title'],$data['message'],$agencies->pluck('id')->toArray() , 'showroom',['type'=>'general']);
            }
        }
        elseif($data['clients'] == 'showrooms'){
            if(count($showrooms)){
                $data['role'] = 'showrooms';
                FacadesNotification::send($showrooms , new  GeneralNotification($data));
                Firebase::send($data['title'],$data['message'],$showrooms->pluck('id')->toArray() , 'showroom',['type'=>'general']);
            }
        }

        //New Cars Only showrooms and agencies
        elseif($data['clients'] == 'new_cars'){
            $data['role'] = 'showrooms';
            $showrooms_new_cars = $showrooms_new_cars->where('type' ,'showroom');
            if ($showrooms_new_cars->count() > 0 ) {
                FacadesNotification::send($showrooms_new_cars, new  GeneralNotification($data));
                Firebase::send($data['title'], $data['message'], $showrooms_new_cars->pluck('id')->toArray(), 'showroom', ['type' => 'general']);
            }

            $data['role'] = 'agencies';
            $agencies_new_cars = $showrooms_new_cars->where('type' ,'agency');
            if ($agencies_new_cars->count() > 0 ) {
                FacadesNotification::send($agencies_new_cars, new  GeneralNotification($data));
                Firebase::send($data['title'], $data['message'], $showrooms_new_cars->pluck('id')->toArray(), 'showroom', ['type' => 'general']);
            }
        }

        //Used Cars users and showrooms
        elseif($data['clients'] == 'used_cars'){

            if(count($users_used_cars)){
                $data['role'] = 'users';
                FacadesNotification::send($users_used_cars, new  GeneralNotification($data));
                Firebase::send($data['title'],$data['message'],$users_used_cars->pluck('id')->toArray() , 'user',['type'=>'general']);
            }

            if(count($showrooms_used_cars)){
                $data['role'] = 'showrooms';
                FacadesNotification::send($showrooms_used_cars , new  GeneralNotification($data));
                Firebase::send($data['title'],$data['message'],$showrooms_used_cars->pluck('id')->toArray() , 'showroom',['type'=>'general']);
            }

        }
    }

    public function getMobileUserData(int $paginate = 15)
    {
        $user = auth('end-user-api')->user();
        return Notification::where('notifiable_id', $user->id)
                            ->where('notifiable_type' , User::class)
                            ->where('read_at', null)
                            ->orderBy('id','desc')
                            ->paginate($paginate);
    }

    public function getMobileShowroomData(int $paginate = 15)
    {
        $user = auth('showroom-api')->user();
        return Notification::where('notifiable_id', $user->id)
                            ->where('notifiable_type' , Showroom::class)
                            ->where('read_at', null)
                            ->orderBy('id','desc')
                            ->paginate($paginate);
    }

}
