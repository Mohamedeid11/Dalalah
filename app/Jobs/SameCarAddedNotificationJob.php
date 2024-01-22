<?php

namespace App\Jobs;

use App\Models\Car;
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

class SameCarAddedNotificationJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;
//    public $tries = 100;
//    public $timeout = 120;
//    public $priority = 'high';

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
        $checkCar = Car::where([
            'brand_id' => $this->car->brand_id,
            'car_model_id' => $this->car->car_model_id,
            'car_model_extension_id' => $this->car->car_model_extension_id,
            'year' => $this->car->year,
        ])->where('id' ,'!=' , $this->car->id)->get();

        // here to check if there are any similar cars or not
        if ($checkCar->count() > 0){
            $users = User::whereIn('id',$checkCar->where('model_name' , User::class)->pluck('model_id'))->get();
            $showrooms = Showroom::whereIn('id',$checkCar->where('model_name' , User::class)->pluck('model_id'))->get();
            if ($users->count() > 0) {
                // send notification
                Notification::send($users, new CarNotification($this->car, 'تم إضافة سيارة مشابهة'));
                Firebase::send(
                    'تم اضافة سيارة مشابهة',
                    'تم إضافة سيارة مشابهة لسيارتك',
                    $users->pluck('id')->toArray(),
                    'user',
                    [
                        'type' => 'approved_showroom_car',
                        'role' => $this->carService->getUserType($this->car)['role'],
                        'id' => $this->car->id
                    ]);
            }
            if ($showrooms->count() > 0) {
                Notification::send($showrooms, new CarNotification($this->car, 'تم إضافة سيارة مشابهة'));
                Firebase::send(
                    'تم اضافة سيارة مشابهة',
                    'تم إضافة سيارة مشابهة لسيارتك',
                    $showrooms->pluck('id')->toArray(),
                    'showroom',
                    [
                        'type' => 'approved_showroom_car',
                        'role' => $this->carService->getUserType($this->car)['role'],
                        'id' => $this->car->id
                    ]);
            }
        }

    }
}
