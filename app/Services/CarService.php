<?php

namespace App\Services;

use App\Jobs\CarAddedNotificationJob;
use App\Models\Admin;
use App\Models\Car;
use App\Models\CarReport;
use App\Models\Showroom;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;

class CarService {

    public function getAdminData(array $data ,int $paginate = 15, $order = 'desc')
    {
        return  Car::admin()->filter($data)->orderBy('id',$order)->paginate($paginate);
    }

    public function getAllCarsDataWithoutAdmin(array $data ,int $paginate = 15, $order = 'desc')
    {
        return  Car::notAdmin()->filter($data)->orderBy('id',$order)->paginate($paginate);

    }

    public function getData(array $data ,int $paginate = 15, $order = 'desc')
    {
        return  Car::filter($data)->orderBy('price',$order)->paginate($paginate);
    }

    public function getMobileData(array $data ,int $paginate = 15, $order = 'DESC')
    {
        if (isset($data['start_price'])  || isset($data['end_price'])){
            $orderBy = 'price';
        }elseif(isset($data['start_year']) || isset($data['end_year'])){
            $orderBy = 'year';
        }else{
            $orderBy = 'id';
        }
        return  Car::filter($data)->hidden(0)->approved()->where('car_id', null)->orderByRaw('ad_type DESC ,' . $orderBy .' '. $order)->paginate($paginate);
    }

    public function getMobileMyCars()
    {
        if (auth('end-user-api')->check()){

            return auth('end-user-api')->user()->cars()->orderBy('id','DESC')->paginate(15);

        }elseif(auth('showroom-api')->check()){

            return auth('showroom-api')->user()->cars()->orderBy('id','DESC')->paginate(15);

        }
    }

    public function getAdminCarsData(array $data ,int $paginate = 15, $order = 'desc')
    {
        return  Car::filter($data)->hidden(0)->approved()->admin()->orderBy('id',$order)->paginate($paginate);
    }

    public function storeAdmin(array $data)
    {
        $car =  Car::create(Arr::except($data , ['images','main_image','features','door-1','door-2','door-3','door-4'])
                    + [
                        'status'       => 'new',
                        'model_name'   => Admin::class,
                        // 'is_hide'      => 1,
                        'model_id'     => auth('admin')->user()->id,
                        'is_approved' => '1',
                    ]);

        if(isset($data['images'])){
            $car->storeFiles($data['images']);
        }
        if(isset($data['main_image'])){
            $car->storeFile($data['main_image'],'-logo');
        }
        if(isset($data['door-1'])){
            $car->storeFile($data['door-1'],'-door-1');
        }
        if(isset($data['door-2'])){
            $car->storeFile($data['door-2'],'-door-2');
        }
        if(isset($data['door-3'])){
            $car->storeFile($data['door-3'],'-door-3');
        }
        if(isset($data['door-4'])){
            $car->storeFile($data['door-4'],'-door-4');
        }
        if(isset($data['features']) && count($data['features'])){
            $car->options()->sync($data['features']);
        }

        // Here to send notification to users that new car added (back side)
        CarAddedNotificationJob::dispatch($car)->onQueue('high');

        return $car;
    }

    public function store(array $data)
    {
        $model = ['showroom'=> Showroom::class , 'agency' => Showroom::class , 'user' =>User::class];
        $car =  Car::create(Arr::except($data , ['images','model_role','main_image','features'])
            + [
                'model_name' =>$model[$data['model_role']],
                'ad_type' => 'basic',
                'is_approved' => 1,
                'expired_at' => Carbon::now()->addDays(setting('feature_basic_duration','en')),
                ]);

        if(isset($data['images'])){
            if (!in_array($data['main_image'] , $data['images'] )){
                $car->storeFiles($data['images']);
            }
        }
        if(isset($data['main_image'])){
            $car->storeFile($data['main_image'],'-logo');
        }
        if(isset($data['features']) && count($data['features'])){
            $car->options()->sync($data['features']);
        }
        // Here to send notification to users that new car added (back side)
        CarAddedNotificationJob::dispatch($car);

        return $car;
    }

    public function getUserType($car){
        $data = [];
        if($car->model_name == Showroom::class){
            $showroom = Showroom::find($car->model_id);
            $data ['type'] = 'showroom';
            $data ['role'] = $showroom->type;
        }elseif($car->model_name == User::class){
            $data ['type'] = 'user';
            $data ['role'] = 'user';
        }else{
            $data ['type'] = 'admin';
            $data ['role'] = 'admin';
        }
        return $data;
    }

    public function update($car , $data)
    {
        if ($car->status == 'new'){

            $Alldata = Arr::except($data , ['images','main_image','features','door-1','door-2','door-3','door-4' ,'status']);

        }elseif($car->status == 'used'){

            $Alldata = Arr::except($data , ['images','main_image','features','door-1','door-2','door-3','door-4' ,'status' ,'monthly_installment']);
        }
        $car->update($Alldata);

        if(isset($data['main_image'])){
            $car->updateFile($data['main_image'],'-logo');
        }
        if(isset($data['door-1'])){
            $car->updateFile($data['door-1'],'-door-1');
        }
        if(isset($data['door-2'])){
            $car->updateFile($data['door-2'],'-door-2');
        }
        if(isset($data['door-3'])){
            $car->updateFile($data['door-3'],'-door-3');
        }
        if(isset($data['door-4'])){
            $car->updateFile($data['door-4'],'-door-4');
        }

        if(isset($data['features']) && count($data['features'])){
            $car->options()->sync($data['features']);
        }
        return $car;
    }

    public function updateMobileImages($car , $data)
    {
        if(isset($data['images'])){
            $car->storeFile($data['images']);
        }

        if(isset($data['main_image'])){
            $car->updateFile($data['main_image'],'-logo');
        }
        return $car;
    }

    public function addOrUpdateReport($car , $data)
    {
        if(isset($data['reports']) && count($data['reports'])){
            $this->handleDeleteReport($car , $data);
            foreach($data['reports'] as $key => $report){
                if(isset($report['option_id'])){
                    $newReport = CarReport::updateOrCreate([
                        'car_id' => $car->id,
                        'report_option_id' => $report['option_id'],
                    ],[
                        'car_id' => $car->id,
                        'report_option_id' => $report['option_id'],
                    ]);
                    if(isset($report['option_image'])){
                        $newReport->updateFile($report['option_image']);
                        $newReport->update(['image' => $newReport->getImage()]);
                    }
                }
            }
        }
    }

    public function handleDeleteReport($car ,$data){
        $ids = [];
        foreach($data['reports'] as $key => $report){
            if(isset($report['option_id'])){
                $ids[] = $report['option_id'];
            }
        }
        DB::table('car_reports')->where('car_id' , $car->id)->whereNotIn('report_option_id', $ids)->delete();
    }

    public function delImg($id)
    {
        DB::table('media')->where('id',$id)->delete();
    }

}
