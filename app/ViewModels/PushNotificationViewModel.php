<?php

namespace App\ViewModels;

use App\Models\Branch;
use App\Models\City;
use App\Models\Notification;
use App\Models\Showroom;
use Spatie\ViewModels\ViewModel;

class PushNotificationViewModel extends ViewModel
{
    // public $cities; 

    public function __construct(public ?Notification $notification = null )
    {
        $this->notification  = is_null($notification) ? new Notification(old()) : $notification;
        // $this->cities = City::get();
    }

    public function action(): string
    {
        return is_null($this->notification->id)
            ? route('admin.push_notification.store')
            : route('admin.push_notification.update', ['push_notification' => $this->notification->id]);
    }

    public function method(): string
    {
        return is_null($this->notification->id) ? 'POST' : 'PUT';
    }   
    
}
