<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use App\Models\Car;
use App\Models\CarType;
use App\Models\Color;
use App\Models\Request as ModelsRequest;
use App\Notifications\RequestCarUserNotification;
use App\Services\CarService;
use App\Services\RequestService;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Notification;
use Spatie\Permission\Commands\Show;

class RequestController extends Controller
{
    private $requestService;
    
    public function __construct()
    {
        $this->requestService = new RequestService();
    }

    public function index(Request $request)
    {
        $requests  = $this->requestService->getData($request->all());
        $carTypes  = CarType::get();
        $colors    = Color::get();
        return view('admin.pages.requests.index' , get_defined_vars());
    }

    public function approved(Request $request)
    {
        $modelRequest = ModelsRequest::find($request->request_id);
        $data = array_merge($request->all(),$modelRequest->toArray());
        $data = Arr::except($data ,[ '_token' , 'id' , 'name' , 'phone' , 'is_approved' , 'created_at' , 'updated_at' ]);
        $this->requestService->storeApprovedCar($data);
        $this->requestService->update($modelRequest ,['is_approved'=> !$modelRequest->is_approved ]);
        session()->flash('success', __('approved status changed successfully'));
        return redirect()->back();
    }
    
}
