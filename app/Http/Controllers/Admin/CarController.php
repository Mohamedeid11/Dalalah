<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Car\StoreCarRequest;
use App\Http\Requests\Admin\Car\UpdateCarRequest;
use App\Models\Admin;
use App\Models\Car;
use App\Models\Report;
use App\Models\Setting;
use App\Models\Showroom;
use App\Models\User;
use App\Notifications\CarStatusSoldNotification;
use App\Notifications\ShowroomApprovedCarNotification;
use App\Services\CarService;
use App\Services\Firebase;
use App\ViewModels\CarViewModel;
use Carbon\Carbon;
use http\Env\Response;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Notification;
use Spatie\Permission\Commands\Show;


class CarController extends Controller
{
    private $carService;

    public function __construct()
    {
        $this->carService = new CarService();
    }

    public function index(Request $request)
    {
        $cars = $this->carService->getAdminData($request->all());
        return view('admin.pages.cars.index' , get_defined_vars());
    }

    public function allAds(Request $request)
    {
        $cars = $this->carService->getAllCarsDataWithoutAdmin($request->all());
        return view('admin.pages.all-ads.index' , get_defined_vars());
    }

    public function create()
    {
        return view('admin.pages.cars.form' , new CarViewModel());
    }

    public function store(StoreCarRequest $storeCarRequest)
    {
        $this->carService->storeAdmin($storeCarRequest->validated());
        session()->flash('success', __('Car Added Successfully'));
        return back();
    }

    public function show(Car $car)
    {
        return view('admin.pages.cars.show' , get_defined_vars());
    }

    public function edit(Car $car)
    {
        return view('admin.pages.cars.form' , new CarViewModel($car));
    }

    public function update(UpdateCarRequest $updateCarRequest, Car $car)
    {
        $this->carService->update($car, $updateCarRequest->validated());
        Session()->flash('success' , __('Car updated successfully'));
        return redirect()->back();
    }

    public function hide(Car $car)
    {
        $this->carService->update($car ,['is_hide'=> !$car->is_hide ]);
        session()->flash('success', __('Hide status changed successfully'));
        return response()->json();
    }


    public function approve(Car $car)
    {
            // if the basic duration or duration with 0 that means he didn't update the features setting
            if (setting('feature_basic_duration','en') == 0 && setting('feature_duration','en') == 0){
                session()->flash('error', __('Need to set Features first'));
                return response()->json();
            }

            if ($car->ad_type == 'featured') {
                $expired_at = Carbon::now()->addDays(setting('feature_duration','en'));
            }else{
                $expired_at = Carbon::now()->addDays(setting('feature_basic_duration','en'));
            }

            $this->carService->update($car , ['is_approved'=> !$car->is_approved , 'expired_at' => $expired_at]);

            if($car->model_name != Admin::class){
                $this->sendNotification($car);
                Firebase::send('Dalalah',
                    'Car is Approved',[$car->model_id],
                    $this->carService->getUserType($car)['type'],
                    [
                        'type' => 'approved_showroom_car',
                        'role' => $this->carService->getUserType($car)['role'],
                        'id'   => $car->id
                    ]);
            }

        session()->flash('success', __('car id Approved successfully'));
        return response()->json();
    }


   public function sendNotification($car){
        if($car->model_name == Showroom::class){
            $showroom = Showroom::find($car->model_id);
            Notification::send($showroom, new ShowroomApprovedCarNotification($car));
        }elseif($car->model_name == User::class){
            $user = User::find($car->model_id);
            Notification::send($user, new ShowroomApprovedCarNotification($car));
        }
   }

    public function buyed(Car $car)
    {
        if($car->status_buyed != 'buyed'){
            $this->carService->update($car ,['status_buyed'=> 'buyed']);

            $admins = Admin::get();
            Notification::send($admins , new CarStatusSoldNotification($car));
        }
       session()->flash('success', __('Hide status changed successfully'));
       return response()->json();
    }

    public function Report(Car $car)
    {
        $reports =  Report::with('options')->get();
        return view('admin.pages.cars.report' , get_defined_vars());
    }

    public function addOrUpdateReport(Request $request)
    {
        $car = Car::find($request->car_id);
        $this->carService->addOrUpdateReport($car , $request->all());
        session()->flash('success', __('report add Successfully'));
        return back();
    }

}
