<?php

namespace App\Notifications;

use App\Models\Showroom;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use Illuminate\Support\Arr;
use Spatie\Permission\Commands\Show;

class PlateNotification extends Notification
{
    use Queueable;
    public $title;

    /**
     * Create a new notification instance.
    */
    public function __construct(public $plate , $title = null)
    {
        $this->title = $title;

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
        $owner = isset($this->plate->showroom_id)
            ?  $this->plate->showroom?->showroom_name
            : $this->plate->user?->name;
        $data = [];
        $data['title']    = $this->title ?? __('site.new_plate_added');
        $data['message']  = $owner;
        $data['id']       = $this->plate->id;
        return $data;
    }

}
