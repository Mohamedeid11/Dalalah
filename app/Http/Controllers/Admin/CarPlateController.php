<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use App\Models\Car;
use App\Models\CarPlate;
use App\Services\CarPlateService;
use App\Services\Firebase;
use Carbon\Carbon;
use Illuminate\Http\Request;

class CarPlateController extends Controller
{
    private $carPlateService;

    public function __construct()
    {
        $this->carPlateService = new CarPlateService();
        $this->middleware('permission:plate.read', ['only' => ['index']]);
        $this->middleware('permission:plate.create', ['only' => ['create', 'store']]);
        $this->middleware('permission:plate.edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:plate.delete', ['only' => ['destroy']]);
    }


    public function allAds(Request $request , int $paginate = 15, $order = 'desc')
    {
        $car_plates = CarPlate::filter($request->all())->orderBy('id',$order)->paginate($paginate);
        return view('admin.pages.all-ads.car_plate' , compact('car_plates'));
    }

    public function hide(CarPlate $carPlate)
    {
        if ($carPlate->is_hide == 0){
            $this->carPlateService->update($carPlate ,['is_hide'=> 1 ]);
        }else{
            $this->carPlateService->update($carPlate ,['is_hide'=> 0 ]);
        }
        session()->flash('success', __('Hide status changed successfully'));
        return response()->json();
    }

    public function approve(CarPlate $carPlate)
    {
        // if the basic duration or duration with 0 that means he didn't update the features setting
        if (setting('feature_basic_duration','en') == 0 && setting('feature_duration','en') == 0){
            session()->flash('error', __('Need to set Features first'));
            return response()->json();
        }

        if ($carPlate->ad_type == 'featured') {
            $expired_at = Carbon::now()->addDays(setting('feature_duration','en'));
        }else{
            $expired_at = Carbon::now()->addDays(setting('feature_basic_duration','en'));
        }

        $this->carPlateService->update($carPlate , ['is_approved'=> !$carPlate->is_approved , 'expired_at' => $expired_at ]);

//            if($carPlate->model_name != Admin::class){
//                $this->sendNotification($car);
//                Firebase::send('Automobile',
//                    'Car is Approved',[$car->model_id],
//                    $this->getUserType($car)['type'],
//                    [
//                        'type' => 'approved_showroom_car',
//                        'role' => $this->getUserType($car)['role'],
//                        'id'   => $car->id
//                    ]);
//            }

        session()->flash('success', __('car Plate Approved successfully'));
        return response()->json();
    }
}
