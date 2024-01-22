<?php

namespace App\Http\Controllers\EndUser;

use App\Http\Controllers\Controller;
use App\Models\Showroom;


class ShowRoomController extends Controller
{
    
    public function index($type)
    {
        return view('end-user.pages.showrooms.index',get_defined_vars());
    }

    public function show(Showroom $showroom)
    {
        return view('end-user.pages.showrooms.show' , get_defined_vars());
    }
    
}
