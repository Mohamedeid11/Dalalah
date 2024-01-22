<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use Illuminate\Support\Arr;
use Spatie\Permission\Commands\Show;

class CarStatusSoldNotification extends Notification
{
    use Queueable;

    /**
     * Create a new notification instance.
     */
    public function __construct(public $car)
    {
        //
    }

    /**
     * Get the notification's delivery channels.
     *
     * @return array<int, string>
     */
    public function via(object $notifiable): array
    {
        return ['database'];
    }

    public function toDatabase($notifiable)
    {
        $owner = $this->car->model_name == Showroom::class 
                                        ?  $this->car->showroom->showroom_name 
                                        : $this->car->user->name;
        $data = [];
        $data['title']    = 'تم بيع عريبة';
        $data['message']  =   $owner;
        $data['id']       =   $this->car->id;
        return $data;
    }
    
}
