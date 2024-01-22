<?php

namespace App\Console\Commands;

use App\Models\Car;
use App\Models\CarPlate;
use Carbon\Carbon;
use Illuminate\Console\Command;

class CheckBasicAds extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'check:basicAds';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Here to check the basic ads if duration finished hide them';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $cars = Car::all();
        $carPlates = CarPlate::all();
        $today = now()->format('Y-m-d');

        foreach ($cars as $car){
            if ($car->expired_at && ($car->ad_type = 'basic') && ($car->expired_at < $today) ){
                $car->update(['ad_type' => null , 'expired_at' => null ,'is_hide' => 0]);
            }
        }

        foreach ($carPlates as $carPlate){
            if ($carPlate->expired_at && ($carPlate->ad_type == 'basic') && ($carPlate->expired_at < $today) ){
                $carPlate->update(['ad_type' => null , 'expired_at' => null ,'is_hide' => 0]);
            }
        }
    }
}
