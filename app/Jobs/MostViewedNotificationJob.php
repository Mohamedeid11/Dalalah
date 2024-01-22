<?php

namespace App\Jobs;

use App\Models\Car;
use App\Models\Showroom;
use App\Models\User;
use App\Notifications\CarNotification;
use App\Services\CarService;
use App\Services\Firebase;
use Carbon\Carbon;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Notification;

class MostViewedNotificationJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    private $carService;

    /**
     * Create a new job instance.
     */
    public function __construct()
    {
        $this->carService = new CarService();

    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        $most_viewed = Car::orderBy('view_count' , 'DESC')->first();

        $users = User::get();
        Notification::send($users , new CarNotification($most_viewed));
        Firebase::send('اكثر السيارات مشاهدة','شاهد اكثر السيارات مشاهدة',$users->pluck('id')->toArray() , 'user',
            [
                'type' => 'approved_showroom_car',
                'role' => $this->carService->getUserType($most_viewed)['role'],
                'id'   => $most_viewed->id
            ]);

        $showroom = Showroom::get();
        Notification::send($showroom , new CarNotification($most_viewed));
        Firebase::send('اكثر السيارات مشاهدة','شاهد اكثر السيارات مشاهدة',$showroom->pluck('id')->toArray() , 'showroom',
            [
                'type' => 'approved_showroom_car',
                'role' => $this->carService->getUserType($most_viewed)['role'],
                'id'   => $most_viewed->id
            ]);


        // Schedule the job for the next second
        $nextWeek = Carbon::now()->addWeek();
//        $this->delay($nextWeek);

    }

    public function failed(\Exception $exception)
    {
        dump( $exception->getMessage() );
    }
}
