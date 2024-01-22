<?php

use App\Http\Controllers\Admin\AjaxController;
use App\Http\Controllers\EndUser\Auth\LoginController;
use App\Http\Controllers\EndUser\Auth\RegisterController;
use App\Http\Controllers\EndUser\CarController;
use App\Http\Controllers\EndUser\ContactController;
use App\Http\Controllers\EndUser\HomeController;
use App\Http\Controllers\EndUser\PageController;
use App\Http\Controllers\EndUser\ProfileController;
use App\Http\Controllers\EndUser\RequestController;
use App\Http\Controllers\EndUser\ShowRoomController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\DashboardController;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/
Route::get('/' , [DashboardController::class , 'index'])->middleware(['auth:admin'])->name('index');

Route::group(
[
	'prefix' => LaravelLocalization::setLocale(),
	'middleware' => [ 'localeSessionRedirect', 'localizationRedirect', 'localeViewPath' ]
], function(){

    Route::group(['as'=>'end-user.'],function(){

//        Route::get('/', [HomeController::class , 'index' ])->name('index');

        Route::get('/', function (){
            return view('index');
        })->name('index');

        Route::get('sell-tradein-your-car' , [HomeController::class , 'sellForm'])->name('sell.form');
        Route::get('track-your-order' , [HomeController::class , 'trackOrder'])->name('track.order');
        Route::post('track-your-order-check' , [HomeController::class , 'trackRequest'])->name('track.order.check');

        //page
        Route::get('page' , [PageController::class , 'show'])->name('page.show');

        //contact
        Route::resource('contact' , ContactController::class);

        //cars
        Route::get('cars', [CarController::class , 'index'])->name('cars.index');
        Route::get('cars/show/{car}', [CarController::class , 'show'])->name('cars.show');
        Route::get('cars-report/{car?}', [CarController::class , 'report'])->name('cars.report');

        //showrooms
        Route::get('showrooms/{type?}', [ShowRoomController::class , 'index'])->name('showrooms.index');
        Route::get('showrooms/show/{showroom}', [ShowRoomController::class , 'show'])->name('showrooms.show');

        Route::middleware(['guest:end-user'])->group(function(){
            Route::get('/user/login', [LoginController::class , 'form' ])->name('login');
            Route::post('/user/login/action', [LoginController::class , 'login' ])->name('login.action');

            Route::get('/user/register', [RegisterController::class , 'form' ])->name('register');
            Route::post('/user/register/create', [RegisterController::class , 'create' ])->name('register.action');
        });

        Route::middleware(['auth:end-user'])->group(function(){
            Route::get('/profile', [ProfileController::class , 'index' ])->name('profile.index');
            Route::get('/profile/dashboard', [ProfileController::class , 'dashboard' ])->name('profile.dashboard');
            Route::get('/profile/addlist', [ProfileController::class , 'AddList' ])->name('profile.addlist');
            Route::get('/profile/edit-list/{car}', [ProfileController::class , 'editList' ])->name('profile.editlist');
            Route::get('/profile/favorite', [ProfileController::class , 'favorite' ])->name('profile.favorite');


            Route::get('sold-car/{car}' , [ProfileController::class , 'buyed'])->name('sold.car');
            Route::post('store-car' , [ProfileController::class , 'storeCar'])->name('store.car');
            Route::post('update-car/{car}' , [ProfileController::class , 'updateCar'])->name('update.car');
            Route::get('/profile/change-password' , [ProfileController::class , 'changePassword'])->name('change.password.view');
            Route::post('/profile/change-password/action' , [ProfileController::class , 'changePasswordAction'])->name('change.password.action');
            Route::post('update/profile', [ ProfileController::class , 'updateProfile'])->name('update.profile');
            Route::get('add-remove-favorite/{car}',[ProfileController::class , 'addOrRemoveFromFavorite'])->name('add-remove-favorite');
            Route::post('/user/logout', [LoginController::class , 'logout' ])->name('logout');
        });

        Route::post('store-request' , [RequestController::class , 'store'])->name('request.store');
    });

    Route::get('img/{car}' , [CarController::class , 'deleteImg'])->name('delete_car_image');
});

Route::middleware('guest:admin')->group(function(){
    Auth::routes(['register' => false]);
});

