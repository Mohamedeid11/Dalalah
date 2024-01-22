<?php

namespace App\Jobs;

use App\Models\Admin;
use App\Models\Showroom;
use App\Models\User;
use App\Notifications\PlateNotification;
use App\Services\CarPlateService;
use App\Services\CarService;
use App\Services\Firebase;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Notification;
class PlateAddedNotificationJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

//    public $tries = 3;
//    public $timeout = 120;

    public  $plate ;
    private $carService ;


    /**
     * Create a new job instance.
     */
    public function __construct($plate)
    {
        $this->plate = $plate;
        $this->carPlateService = new CarPlateService();
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        $admins = Admin::get();
        Notification::send($admins , new PlateNotification($this->plate));

        $users = User::get();
        Notification::send($users , new PlateNotification($this->plate));
        Firebase::send(
            __('site.new_plate_added'),
            __('site.new_plate_added'),
            $users->pluck('id')->toArray(),
            'user',
            [
                'type' => 'plate_added',
                'role' => ($this->plate->showroom) ? $this->plate->showroom->type : 'user',
                'id'   => $this->plate->id
            ]);

        $showroom = Showroom::get();
        Notification::send($showroom , new PlateNotification($this->plate));
        Firebase::send(
            __('site.new_plate_added'),
            __('site.new_plate_added'),
            $showroom->pluck('id')->toArray(),
            'showroom',
            [
                'type' => 'plate_added',
                'role' => ($this->plate->showroom) ? $this->plate->showroom->type : 'user',
                'id'   => $this->plate->id
            ]);
    }
}
