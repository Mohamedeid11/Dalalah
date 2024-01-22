<?php

namespace App\Services;

use App\Jobs\PlateAddedNotificationJob;
use App\Models\CarPlate;
use Carbon\Carbon;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Notification;
use Illuminate\Support\Str;

class CarPlateService {

    public function getData(array $data ,int $paginate = 15, $order = 'desc')
    {
        return  CarPlate::filter($data)->orderBy('price',$order)->paginate($paginate);
    }

    public function getMobileData(array $data ,int $paginate = 15, $order = 'DESC')
    {
        if (isset($data['start_price'])  || isset($data['end_price'])){
            $orderBy = 'price';
        }else{
            $orderBy = 'id';
        }
        return  CarPlate::filter($data)->hidden(0)->approved()->orderBy($orderBy,$order)->paginate($paginate);
    }

    public function getUserMobileData(array $data ,int $paginate = 15, $order = 'DESC')
    {
        $user = auth('end-user-api')->user() ?? auth('showroom-api')->user();
        $CarPlate =  $user->carPlates()->filter($data)->orderBy('id',$order)->paginate($paginate);

        return $CarPlate;
    }


    public function store(array $data)
    {
        if (auth('end-user-api')->check()){
            $data['user_id'] = auth('end-user-api')->user()->id;
        }elseif(auth('showroom-api')->check()){
            $data['showroom_id'] = auth('showroom-api')->user()->id;
        }
        $carPlate = CarPlate::create($data + [
            'ad_type' => 'basic',
            'expired_at' => Carbon::now()->addDays(setting('feature_basic_duration','en'))
            ]);

        // Here to send notification to users that new car added (back side)
        PlateAddedNotificationJob::dispatch($carPlate);

        return $carPlate;
    }


    public function update($CarPlate , $data)
    {
        if (isset($data['letter_en'])){
            $data['letter_en'] = Str::lower($data['letter_en']);
            $data['letter_en'] = preg_replace('/\s/u' ,' ', $data['letter_en']);
            $data['letter_ar'] = preg_replace('/\s/u', ' ', $data['letter_ar']);
        }

        if ($CarPlate){
            $CarPlate->update($data);
            return $CarPlate;
        }

    }

    public function getShowroomPlates($showroom_id )
    {
        $CarPlates =  CarPlate::where(['showroom_id' => $showroom_id])->paginate(15);
        return $CarPlates;
    }

    public function delImg($id)
    {
        DB::table('media')->where('id',$id)->delete();
    }

}
