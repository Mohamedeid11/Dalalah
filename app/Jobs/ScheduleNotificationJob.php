<?php

namespace App\Jobs;

use App\Models\ScheduleNotification;
use App\Models\Showroom;
use App\Models\User;
use App\Notifications\GeneralNotification;
use App\Services\Firebase;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Notification as FacadesNotification;

class ScheduleNotificationJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $data;
    /**
     * Create a new job instance.
     */
    public function __construct(array $data)
    {
        $this->data = $data;
    }

    /**
     * Execute the job.
     */
    public function handle()
    {
        $notifications = ScheduleNotification::status(0)->where('date' , '<=' , now())->get();
        if ($notifications->count() > 0) {

            foreach ($notifications as $notification) {

                $data = [
                    'title' => $notification->title,
                    'message' => $notification->message,
                    ];
                $users = User::get();
                $showrooms = Showroom::get();

                $data['role'] = 'users';
                FacadesNotification::send($users, new  GeneralNotification($data));
                $data['role'] = 'showrooms';
                FacadesNotification::send($showrooms, new  GeneralNotification($data));

                if (count($users)) {
                    Firebase::send($notification->title, $notification->message, $users->pluck('id')->toArray(), 'user', ['type' => 'general']);
                }
                if (count($showrooms)) {
                    Firebase::send($notification->title, $notification->message, $showrooms->pluck('id')->toArray(), 'showroom', ['type' => 'general']);
                }
                $notification->update(['status' => true]);

            }

            return 'done';
        }
//        $this->dispatch($date);

    }

    public function failed(\Exception $exception)
    {
        dump( $exception->getMessage() );
    }
}
