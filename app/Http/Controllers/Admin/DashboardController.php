<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Car;
use App\Models\Showroom;
use App\Models\User;
use Illuminate\Http\Request;
use Spatie\Permission\Commands\Show;

class DashboardController extends Controller
{

    public function index(){
        $cars      = Car::count();
        $showrooms = Showroom::countShowroom();
        $agencies  = Showroom::countAgency();
        $users     = User::count();
        $lastUsers = User::orderBy('id' , 'DESC')->get()->take(5);
        $lastShowrooms = Showroom::orderBy('id' , 'DESC')->get()->take(5);
        return view('admin.index' ,get_defined_vars());
    }
    
}
