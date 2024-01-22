<?php

use App\Http\Controllers\Showroom\Auth\LoginController;

use App\Http\Controllers\Showroom\ProfileController;
use Illuminate\Support\Facades\Route;
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

Route::group(
[
	'prefix' => LaravelLocalization::setLocale(),
	'middleware' => [ 'localeSessionRedirect', 'localizationRedirect', 'localeViewPath' ]
], function(){

    Route::group( ['prefix' => 'showroom', 'name' => 'showroom.' , 'guest:showroom'] , function(){

        Route::get('login', [LoginController::class , 'form'])->name('login');
        Route::post('action', [LoginController::class , 'action'])->name('action');

    });

    Route::group( ['prefix' => 'showroom' , 'name' => 'showroom.','middleware' => 'auth:showroom'] , function(){

        //profile
        Route::get('/profile/dashboard' ,[ProfileController::class , 'dashboard' ])->name('dashboard');
        Route::get('/profile', [ProfileController::class , 'index' ])->name('profile.index');
        Route::post('update/profile', [ ProfileController::class , 'updateProfile'])->name('update.profile');

        //password
        Route::get('/profile/change-password' , [ProfileController::class , 'changePassword'])->name('change.password.view');
        Route::post('/profile/change-password/action' , [ProfileController::class , 'changePasswordAction'])->name('change.password.action');

        //branches
        Route::get('/profile/branches', [ProfileController::class , 'branches' ])->name('profile.branches');
        Route::get('/profile/createBranch', [ProfileController::class , 'createBranch' ])->name('profile.create.branch');
        Route::post('/profile/storeBranch', [ProfileController::class , 'storeBranch' ])->name('profile.store.branch');
        Route::get('/profile/editBranch/{branch}', [ProfileController::class , 'editBranch' ])->name('profile.edit.branch');
        Route::put('/profile/updateBranch/{branch}', [ProfileController::class , 'updateBranch' ])->name('profile.update.branch');
        Route::delete('/profile/deleteBranch/{branch}', [ProfileController::class , 'deleteBranch' ])->name('profile.delete.branch');

        //cars
        Route::get('/profile/addlist', [ProfileController::class , 'AddList' ])->name('profile.addlist');
        Route::post('store-car' , [ProfileController::class , 'storeCar'])->name('store.car');
        Route::get('/profile/edit-list/{car}', [ProfileController::class , 'editList' ])->name('profile.editlist');
        Route::post('update-car/{car}' , [ProfileController::class , 'updateCar'])->name('update.car');
        Route::get('/profile/cars', [ProfileController::class , 'cars' ])->name('profile.cars');
        Route::get('sold-car/{car}' , [ProfileController::class , 'buyed'])->name('sold.car');

        //logout
        Route::post('/logout', [LoginController::class , 'logout' ])->name('logout');

    });

});



