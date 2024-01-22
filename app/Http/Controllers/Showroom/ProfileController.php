<?php

namespace App\Http\Controllers\Showroom;

use App\Http\Controllers\Controller;
use App\Http\Requests\Showroom\Auth\EditProfileRequest;
use App\Http\Requests\Showroom\Branch\StoreBranchRequest;
use App\Http\Requests\Showroom\Branch\UpdateBranchRequest;
use App\Models\Admin;
use App\Models\Branch;
use App\Models\Brand;
use App\Models\Car;
use App\Models\CarType;
use App\Models\City;
use App\Models\Color;
use App\Models\Feature;
use App\Models\Showroom;
use App\Models\User;
use App\Notifications\CarStatusSoldNotification;
use App\Services\BranchService;
use App\Services\CarService;
use App\Services\EndUserService;
use App\Services\ShowRoomService;
use App\ViewModels\BranchViewModel;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Notification;
use Spatie\Permission\Commands\Show;

class ProfileController extends Controller
{
    public $endUserService;
    public $carService;
    public $showroomService;
    public $branchService;
    
    public function __construct()
    {
        $this->endUserService   = new EndUserService();
        $this->showroomService  = new ShowRoomService();
        $this->carService       = new CarService(); 
        $this->branchService    = new BranchService();
    }
    
    public function index()
    {
        return view('showroom.profile.index'); 
    }

    public function dashboard()
    {
        $cars        = auth('showroom')->user()->cars()->with(['brand','brandModel'])->where('model_name', Showroom::class)->paginate();
        $allCars     = auth('showroom')->user()->cars()->where('model_name', User::class)->count();
        $allHide     = auth('showroom')->user()->cars()->where('model_name', User::class)->hidden(1)->count();
        $allApproved = auth('showroom')->user()->cars()->where('model_name', User::class)->approved()->count();
        return view('showroom.profile.dashboard' , get_defined_vars()); 
    }

    public function addList(){
        $brands     = Brand::get();
        $bodyTypes  = CarType::get();
        $years      = range(Carbon::now()->year, 1990);
        $colors     = Color::get();
        $cities     = City::get();
        $features   = Feature::with('options')->get();
        return view('showroom.profile.addlist' , get_defined_vars()); 
    }

    public function editList(Car $car)
    {
        $brands     = Brand::get();
        $bodyTypes  = CarType::get();
        $years      = range(Carbon::now()->year, 1990);
        $colors     = Color::get();
        $cities     = City::get();
        $features   = Feature::with('options')->get();
        return view('showroom.profile.editlist' , get_defined_vars()); 
    }

    public function cars(Request $request)
    {
        $cars   = auth('showroom')->user()->cars()->filter($request->all())
                    ->with(['brand','brandModel'])->where('model_name', Showroom::class)->paginate();
        return view('showroom.profile.cars' , get_defined_vars());
    }

    public function changePassword()
    {
        return view('showroom.profile.changepassword');
    }

    public function changePasswordAction(Request $request)
    {
        # Validation
        $request->validate([
            'old_password' => 'required',
            'new_password' => 'required|confirmed',
        ]);
        #Match The Old Password
        
        if(!Hash::check($request->old_password, auth('showroom')->user()->password)){
            return back()->with("error", "Old Password Doesn't match!");
        }

        #Update the new Password
        Showroom::whereId(auth('showroom')->user()->id)->update([
            'password' => Hash::make($request->new_password)
        ]);
        Session()->flash('success', __('mobileValidation.password_changed_Successfully'));
        return back();
    }

    ////////////////********************************** remove branches to custom controller */
    public function branches()
    {
        $branches = Branch::orderBy('id','desc')->where('showroom_id' , auth('showroom')->user()->id)->where('is_hide', 0)->paginate();
        return view('showroom.profile.branches.index' , get_defined_vars());
    }

    public function createBranch(){
        $cities     = City::get();
        return view('showroom.profile.branches.create' , get_defined_vars());
    }
    
    public function storeBranch(StoreBranchRequest $request){
        $this->branchService->store($request->all());
        Session()->flash('success', __('site.branch_added_Successfully'));
        return back();
    }

    public function editBranch(Branch $branch){
        $cities     = City::get();
        return view('showroom.profile.branches.edit' , get_defined_vars());
    }

    public function updateBranch(UpdateBranchRequest $updateBranchRequest ,Branch $branch){
        $this->branchService->update($branch, $updateBranchRequest->validated());
        Session()->flash('success' , __('branch updated successfully'));
        return redirect()->back();
    }

    public function deleteBranch(Branch $branch)
    {
        if(count($branch->cars)){
            Session()->flash('error' , __('cannot Delete branch'));
            return redirect()->back();
        }else{
            $this->branchService->delete($branch);
            Session()->flash('success' , __('branch Deleted successfully'));
            return redirect()->back();
        }
    }
    ////////////////********************************** remove branches to custom controller */

    public function storeCar(Request $request)
    {
        $this->carService->store($request->all());
        Session()->flash('success', __('mobileValidation.car_added_Successfully'));
        return back();
    }

    public function updateCar(Car $car, Request $request)
    {
        $car = $this->carService->update($car,$request->all());
        Session()->flash('success', __('mobileValidation.car_updated_Successfully'));
        return back();
    }

    public function updateProfile(EditProfileRequest $request)
    {
      
        $showroom = Showroom::findOrFail(auth('showroom')->user()->id);
        $this->showroomService->update($showroom , $request->all());
        Session()->flash('success', __('mobileValidation.update_profile_Successfully'));
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
