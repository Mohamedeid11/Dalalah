<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\AdminStoreRequest;
use App\Http\Requests\Admin\AdminUpdateRequest;
use App\Models\Admin;
use App\Models\User;
use App\Services\Firebase;
use App\Services\UserService;
use App\ViewModels\AdminViewModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use RealRashid\SweetAlert\Facades\Alert;


class UserController extends Controller
{
    public $userService;

    public function __construct()
    {
        $this->userService = new UserService();
        $this->middleware('permission:users.read', ['only' => ['index']]);
        $this->middleware('permission:users.create', ['only' => ['create', 'store']]);
        $this->middleware('permission:users.edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:users.delete', ['only' => ['destroy']]);
    }

    public function index(Request $request)
    {
        $users = $this->userService->getData($request->all());
        return view('admin.pages.users.index', get_defined_vars());
    }

    public function getCars(User $user){
        $cars = $user->cars()->with(['brand' , 'brandModel' , 'brandModelExtension'])->where('model_name', User::class)->paginate();
        return view('admin.pages.users.list_cars' , get_defined_vars());
    }

    public function blocked(User $user)
    {
        $this->userService->update($user ,['is_blocked'=> !$user->is_blocked ]);

        // if($user->is_blocked){
        //     $user->cars()->where('model_name', User::class)->each(function ($item){
        //         $item->update(['is_hide'=>1]);
        //     });
        // }else{
        //     $user->cars()->where('model_name', User::class)->each(function ($item){
        //         $item->update(['is_hide'=>0]);
        //     });
        // }

       session()->flash('success', __('Blocked status changed successfully'));
       return response()->json();
    }

    public function updateToken(Request $request){
        $user = User::find(13); // pick user to put the notification on it
        $user->fcm_token = $request->token;
        $user->save();
        return response()->json(['Token Updated Successfully']);

    }

    public function updatePassword(Request $request,User $user){
        // Validate the form data
        $request->validate([
            'new_password' => 'required|min:8|confirmed',
        ]);

        $user->update(['password' => $request->new_password]);

        session()->flash('success', __('Password Changed successfully'));
        return redirect()->back();
    }

}
