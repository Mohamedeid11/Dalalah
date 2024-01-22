<?php

namespace App\Http\Controllers\EndUser;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Request\TrackRequestRequest;
use App\Models\Admin;
use App\Models\Brand;
use App\Models\Car;
use App\Models\City;
use App\Models\Request as ModelsRequest;
use App\Models\Showroom;
use App\Models\Slider;
use App\Models\User;
use App\Services\Firebase;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;


class HomeController extends Controller
{
    
    public function index()
    {
        $sliders    = cache()->remember('sliders', 60 * 60, function () {
                        return Slider::with('media')->get();
                    });
        $adminCars  = cache()->remember('adminCars', 60 * 60, function () {
                        return Car::with(['media' , 'brand' , 'brandModel'])->admin()->hidden(0)->approved()->get()->take(4);
                    });
        $userCars   = cache()->remember('userCars', 60 * 60, function () {
                        return Car::with(['media' , 'brand' , 'brandModel'])->notAdmin()->status('used')->hidden(0)->approved()->get()->take(4);
                    });            
        $showrooms  = cache()->remember('showrooms', 60 * 60, function () {
                        return Showroom::with('media')->withCount(['cars','branches'])->where('type', 'showroom')->get()->take(4);
                    });
        $agencies   = cache()->remember('agencies', 60 * 60, function () {
                        return Showroom::with('media')->withCount(['cars','branches'])->where('type', 'agency')->get()->take(4);
                    });
        $brands     = cache()->remember('brands', 60 * 60, function () {
                        return Brand::with('media')->get();
                    });
        $years      =  range(Carbon::now()->year, 1990);            
        return view('end-user.index' , get_defined_vars());
    }

    public function sellForm()
    {
        $brands  = Brand::get();
        $years   = range(Carbon::now()->year, 1990);
        $cities  = City::get();
        return view('end-user.buy_form' , get_defined_vars());
    }

    public function trackOrder()
    {
        return view('end-user.track_order');
    }

    public function trackRequest(TrackRequestRequest $trackRequestRequest)
    {
        $request = ModelsRequest::where('phone' , $trackRequestRequest->phone)->orderBy('id','desc')->first();
        if($request){
            return response()->json(['data' => $request->is_approved  == 0 ? 'Order is pending' : 'Order is approved']);
        }
        return response()->json(['data' => 'Order Not Found']);
    }
    
}
