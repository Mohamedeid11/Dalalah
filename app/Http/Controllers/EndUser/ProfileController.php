<?php

namespace App\Http\Controllers\EndUser;

use App\Http\Controllers\Controller;
use App\Http\Requests\EndUser\Auth\EditProfileRequest;
use App\Models\Admin;
use App\Models\Brand;
use App\Models\Car;
use App\Models\CarType;
use App\Models\City;
use App\Models\Color;
use App\Models\Feature;
use App\Models\User;
use App\Notifications\CarStatusSoldNotification;
use App\Services\CarService;
use App\Services\EndUserService;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Notification;

class ProfileController extends Controller
{
    public $endUserService;
    public $carService;
    
    public function __construct()
    {
        $this->endUserService = new EndUserService();
        $this->carService     = new CarService(); 
    }
    
    public function index()
    {
        $cities     = City::get();
        return view('end-user.pages.profile.index' , get_defined_vars()); 
    }

    public function dashboard(){
        $cars        = auth('end-user')->user()->cars()->with(['brand','brandModel'])->where('model_name', User::class)
                        ->paginate();
        $allCars     = auth('end-user')->user()->cars()->where('model_name', User::class)->count();
        $allHide     = auth('end-user')->user()->cars()->where('model_name', User::class)->hidden(1)->count();
        $allApproved = auth('end-user')->user()->cars()->where('model_name', User::class)->approved()->count();
        return view('end-user.pages.profile.dashboard' , get_defined_vars()); 
    }

    public function addList(){
        $brands     = Brand::get();
        $bodyTypes  = CarType::get();
        $years      = range(Carbon::now()->year, 1990);
        $colors     = Color::get();
        $cities     = City::get();
        $features   = Feature::with('options')->get();
        return view('end-user.pages.profile.addlist' , get_defined_vars()); 
    }

    public function editList(Car $car){
        $brands     = Brand::get();
        $bodyTypes  = CarType::get();
        $years      = range(Carbon::now()->year, 1990);
        $colors     = Color::get();
        $cities     = City::get();
        $features   = Feature::with('options')->get();
        return view('end-user.pages.profile.editlist' , get_defined_vars()); 
    }

    public function favorite(){
        $favorites = auth('end-user')->user()->favorites;
        return view('end-user.pages.profile.favorite' , get_defined_vars());
    }

    public function changePassword(){
        return view('end-user.pages.profile.changepassword');
    }

    public function changePasswordAction(Request $request){
        # Validation
        $request->validate([
            'old_password' => 'required',
            'new_password' => 'required|confirmed',
        ]);
        #Match The Old Password
        if(!Hash::check($request->old_password, auth('end-user')->user()->password)){
            return back()->with("error", "Old Password Doesn't match!");
        }

        #Update the new Password
        User::whereId(auth('end-user')->user()->id)->update([
            'password' => Hash::make($request->new_password)
        ]);
        Session()->flash('success', __('mobileValidation.password_changed_Successfully'));
        return back();
    }


    public function storeCar(Request $request){
        $this->carService->store($request->all());
        Session()->flash('success', __('mobileValidation.car_added_Successfully'));
        return back();
    }

    public function updateCar(Car $car, Request $request){
        $car = $this->carService->update($car,$request->all());
        Session()->flash('success', __('mobileValidation.car_updated_Successfully'));
        return back();
    }

    public function updateProfile(EditProfileRequest $request)
    {
        $user = User::findOrFail(auth('end-user')->user()->id);
        $this->endUserService->update($user , $request->all());
        Session()->flash('success', __('mobileValidation.update_profile_Successfully'));
        return back();
    }

    public function addOrRemoveFromFavorite(Car $car)
    {
        $user = auth('end-user')->user();
        $favoriteCars = $user->favorites()->pluck('car_id')->toArray();
        if(!in_array($car->id , $favoriteCars)){
            $user->favorites()->attach($car->id);
            Session()->flash('success', __('mobileValidation.add_to_favorite_Successfully'));
        }else{
            $user->favorites()->detach($car->id);
            Session()->flash('success', __('mobileValidation.remove_from_favorite_Successfully'));
        }
        return back();
    }

    public function buyed(Car $car)
    {
        if($car->status_buyed != 'buyed'){      
            $this->carService->update($car ,['status_buyed'=> 'buyed']);
          
            $admins = Admin::get();
            Notification::send($admins , new CarStatusSoldNotification($car));
        }
       session()->flash('success', __('Car Sold successfully'));
       return response()->json();
    }

}
