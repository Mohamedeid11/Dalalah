<?php

namespace App\Console\Commands;

use App\Models\Car;
use App\Models\CarPlate;
use App\Models\Showroom;
use Illuminate\Console\Command;

class CheckShowroomPayment extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'check:packagePayment';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Here to Check Showroom Payment after it ends make the ads as hidden';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $showrooms = Showroom::all();
        $today = now()->format('Y-m-d');
        foreach ($showrooms as $showroom){
            if ($showroom->expired_date && ($showroom->expired_date->format('Y-m-d') < $today) ){

                $showroom->update(['is_hide' => 1]);

                Car::where(['model_name' => Showroom::class , 'model_id' => $showroom->id , 'ad_type' => 'basic'])->update(['is_hide' => 0]);
                CarPlate::where( ['showroom_id ' => $showroom->id , 'ad_type' => 'basic'])->update(['is_hide' => 0]);
            }
        }
    }
}
