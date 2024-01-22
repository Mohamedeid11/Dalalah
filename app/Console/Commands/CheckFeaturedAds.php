<?php

namespace App\Console\Commands;

use App\Models\Car;
use App\Models\CarPlate;
use App\Models\Showroom;
use App\Models\User;
use App\Notifications\CarNotification;
use App\Notifications\PlateNotification;
use App\Services\CarService;
use App\Services\Firebase;
use Carbon\Carbon;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Notification;

class CheckFeaturedAds extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'check:featuredAds';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Here to Check if the featured ad has finished turn them to basic ad';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $carService = new CarService();

        $cars = Car::all();
        $carPlates = CarPlate::all();
        $today = now()->format('Y-m-d');


        $carUsers = User::whereHas('cars', function ($query) use ($today) {
            $query->where('ad_type' , 'featured')->where( 'expired_at' , '<' , $today);
        })->get();

        $carShowrooms = Showroom::whereHas('cars', function ($query) use ($today) {
            $query->where('ad_type' , 'featured')->where( 'expired_at' , '<' , $today);
        })->get();

        foreach ($cars as $car){
            if ($car->expired_at && ($car->ad_type = 'featured') && ($car->expired_at < $today) ){
                $car->update([
                    'ad_type' => 'basic' ,
                    'expired_at' => Carbon::now()->addDays(setting('feature_basic_duration','en'))
                ]);

                if ($carUsers->count() > 0) {
                    Notification::send($carUsers, new CarNotification($car, __('site.featured_ad_ended')));
                    Firebase::send(
                        __('site.featured_ad_ended'),
                        __('site.featured_ad_ended'),
                        $carUsers->pluck('id')->toArray(),
                        'user',
                        [
                            'type' => 'approved_showroom_car',
                            'role' => $carService->getUserType($car)['role'],
                            'id' => $car->id
                        ]);
                }

                if ($carShowrooms->count() > 0) {
                    Notification::send($carShowrooms, new CarNotification($car, __('site.featured_ad_ended')));
                    Firebase::send(
                        __('site.featured_ad_ended'),
                        __('site.featured_ad_ended'),
                        $carShowrooms->pluck('id')->toArray(),
                        'showroom',
                        [
                            'type' => 'approved_showroom_car',
                            'role' => $carService->getUserType($car)['role'],
                            'id' => $car->id
                        ]);
                }

            }
        }



        $plateUsers = User::whereHas('carPlates', function ($query) use ($today) {
            $query->where('ad_type' , 'featured')->where( 'expired_at' , '<' , $today);
        })->get();

        $plateShowrooms = Showroom::whereHas('carPlates', function ($query) use ($today) {
            $query->where('ad_type' , 'featured')->where( 'expired_at' , '<' , $today);
        })->get();

        foreach ($carPlates as $carPlate){
            if ($carPlate->expired_at &&( $carPlate->ad_type == 'featured' )&& ($carPlate->expired_at < $today) ) {
                $carPlate->update([
                    'ad_type' => 'basic' ,
                    'expired_at' => Carbon::now()->addDays(setting('feature_basic_duration','en'))
                ]);

                // send notification to users
                if ($plateUsers->count() > 0) {
                    Notification::send($plateUsers, new PlateNotification($carPlate, __('site.featured_ad_ended')));
                    Firebase::send(
                        __('site.featured_ad_ended'),
                        __('site.featured_ad_ended'),
                        $plateUsers->pluck('id')->toArray(),
                        'user',
                        [
                            'type' => 'approved_showroom_car',
                            'role' => ($carPlate->showroom) ? $carPlate->showroom->type : 'user',
                            'id' => $carPlate->id
                        ]);
                }

                // send notification to showrooms
                if ($plateShowrooms->count() > 0) {
                    Notification::send($plateShowrooms, new PlateNotification($carPlate, __('site.featured_ad_ended')));
                    Firebase::send(
                        __('site.featured_ad_ended'),
                        __('site.featured_ad_ended'),
                        $plateShowrooms->pluck('id')->toArray(),
                        'showroom',
                        [
                            'type' => 'approved_showroom_car',
                            'role' => ($carPlate->showroom) ? $carPlate->showroom->type : 'user',
                            'id' => $carPlate->id
                        ]);
                }

            }
        }
    }
}
