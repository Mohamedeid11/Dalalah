<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\JobCategory\JobCategoryStoreRequest;
use App\Http\Requests\Admin\JobCategory\JobCategoryUpdateRequest;
use App\Http\Requests\Admin\PushNotification\StorePushNotificationRequest;
use App\Http\Requests\Admin\Slider\SliderStoreRequest;
use App\Http\Requests\Admin\Slider\SliderUpdateRequest;
use App\Models\JobCategory;
use App\Models\Notification\Notification;
use App\Models\Slider;
use App\Services\JobCategoryService;
use App\Services\PushNotificationService;
use App\Services\SliderService;
use App\ViewModels\JobCategoryViewModel;
use App\ViewModels\PushNotificationViewModel;
use App\ViewModels\SliderViewModel;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

class PushNotificationController extends Controller
{

    private $pushNotificationService;

    public function __construct()
    {
        $this->pushNotificationService = new PushNotificationService();
        $this->middleware('permission:push_notification.read', ['only' => ['index']]);
        $this->middleware('permission:push_notification.create', ['only' => ['create', 'store']]);
    }

    /**
     * Display a listing of the resource.
     */
    public function index(Request $request) : View
    {
        $notifications = $this->pushNotificationService->getData($request->all());
        return view('admin.pages.push_notification.index' , get_defined_vars());
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create() : View
    {
        return view('admin.pages.push_notification.form' , new PushNotificationViewModel());
    }

    /**
     * Store a newly created resource in storage.
    */
    public function store(StorePushNotificationRequest $request) : RedirectResponse
    {
        $this->pushNotificationService->store($request->validated());
        session()->flash('success', __('تم اضافة الاشعارات '));
        return back();
    }

    public function destroy(Notification $pushNotification)
    {
        dd($pushNotification);
        // $this->featureService->delete($feature);
        Session()->flash('success' , __('Notification Deleted successfully'));
        return redirect()->back();
    }

}
