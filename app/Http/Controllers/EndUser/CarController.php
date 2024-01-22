<?php

namespace App\Http\Controllers\EndUser;

use App\Http\Controllers\Controller;
use App\Models\Car;
use App\Models\Showroom;
use App\Services\CarService;
use Illuminate\Http\Request;

class CarController extends Controller
{
    public $carService;

    public function __construct()
    {
        $this->carService =  new CarService();   
    }

    public function index(Request $request){
        // $cars = Car::where('is_hide',0)->where('is_approved',1)->filter($request->all())->paginate();    
        return view('end-user.pages.cars.index',get_defined_vars());
    }

    public function show(Car $car){
        $cars = cache()->remember('cars', 60 * 60, function () use($car){
                    return Car::with('media')->where('id' ,'!=', $car->id)
                    ->where('model_name',$car->model_name)->where('is_hide',0)
                    ->where('is_approved',1)->get()->take(4);
                });
        $showroomCars = cache()->remember('$showroomCars', 60 * 60, function () use($car){
                    return Car::with(['media' , 'showroom' , 'brand'])->where('id' ,'!=', $car->id)
                    ->where('model_name',Showroom::class)
                    ->where('brand_id' , $car->brand_id)
                    ->where('is_hide',0)
                    ->where('is_approved',1)
                    ->get()->take(4);
                });        
        return view('end-user.pages.cars.show' , get_defined_vars());
    }

    public function report(Car $car){
        return view('end-user.pages.cars.reports' , get_defined_vars());
    }

    public function deleteImg($id){
        $this->carService->delImg($id);
        session()->flash('success' , 'delete image successfully');
        return back();
    }
    
}
