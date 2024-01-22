<?php 

namespace App\Services;

use App\Models\Admin;
use App\Models\Car;
use App\Models\Request;
use App\Notifications\RequestCarUserNotification;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Notification;


class RequestService {

    public function getData(array $data ,int $paginate = 15, $order = 'desc')
    {
        return  Request::orderBy('id',$order)->paginate($paginate);
    }

    public function storeApprovedCar(array $data){
        $car =  Car::create($data +
                [ 
                    'status'     => 'used' ,
                    'model_name' => Admin::class , 
                    'model_id'   => auth('admin')->user()->id,
                    'status_buyed' => 'approved',
                    'is_hide'=> 1 
                ]);
        return $car; 
    }

    public function store(array $data)
    {
        $request =  Request::create($data);
        $admins = Admin::get();
        Notification::send($admins , new RequestCarUserNotification('data'));
        return $request;
    }

    public function update($request , $data)
    {
        $request->update($data);
        return $request;
    }

}