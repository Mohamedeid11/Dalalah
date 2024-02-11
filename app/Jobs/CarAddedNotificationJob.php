<?php

namespace App\Jobs;

use App\Models\Admin;
use App\Models\Showroom;
use App\Models\User;
use App\Notifications\CarNotification;
use App\Services\CarService;
use App\Services\Firebase;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Notification;
class CarAddedNotificationJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $tries = 3;
    public $timeout = 120;
    public $priority = 'high';

    public  $car ;
    private $carService ;


    /**
     * Create a new job instance.
     */
    public function __construct($car)
    {
        $this->car = $car;
        $this->carService = new CarService();
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        $admins = Admin::get();
        Notification::send($admins , new CarNotification($this->car));

        $users = User::whereNotNull('fcm_token')->get();
        Notification::send($users , new CarNotification($this->car));
        Firebase::send(
            'تم اضافة سيارة جديدة',
            'تم إضافة سيارة جديدة',
            $users->pluck('id')->toArray(),
            'user',
            [
                'type' => 'approved_showroom_car',
                'role' => $this->carService->getUserType($this->car)['role'],
                'id'   => $this->car->id
            ]);

        $showroom = Showroom::whereNotNull('fcm_token')->get();
        Notification::send($showroom , new CarNotification($this->car));
        Firebase::send(
            'تم اضافة سيارة جديدة',
            'تم إضافة سيارة جديدة',
            $showroom->pluck('id')->toArray(),
            'showroom',
            [
                'type' => 'approved_showroom_car',
                'role' => $this->carService->getUserType($this->car)['role'],
                'id'   => $this->car->id
            ]);
    }
}
