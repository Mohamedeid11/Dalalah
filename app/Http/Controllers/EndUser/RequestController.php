<?php

namespace App\Http\Controllers\EndUser;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use App\Notifications\RequestCarUserNotification;
use App\Services\RequestService;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Notification as FacadesNotification;


class RequestController extends Controller
{
    public $requestService;
    
    public function __construct()
    {
        $this->requestService = new RequestService();   
    }
    
    public function store(Request $request)
    {
        $this->requestService->store($request->all());
        return response()->json(['data' => 'success']);
    }
    
}
