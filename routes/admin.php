<?php
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\BranchController;
use App\Http\Controllers\Admin\BrandController;
use App\Http\Controllers\Admin\CarController;
use App\Http\Controllers\Admin\CarModelController;
use App\Http\Controllers\Admin\CarPlateController;
use App\Http\Controllers\Admin\CarTypeController;
use App\Http\Controllers\Admin\CityController;
use App\Http\Controllers\Admin\ColorController;
use App\Http\Controllers\Admin\ContactController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\DistrictController;
use App\Http\Controllers\Admin\FeatureController;
use App\Http\Controllers\Admin\FeatureOptionController;
use App\Http\Controllers\Admin\PackageController;
use App\Http\Controllers\Admin\PageController;
use App\Http\Controllers\Admin\PushNotificationController;
use App\Http\Controllers\Admin\ReportController;
use App\Http\Controllers\Admin\ReportOptionController;
use App\Http\Controllers\Admin\RequestController;
use App\Http\Controllers\Admin\RoleController;
use App\Http\Controllers\Admin\SettingController;
use App\Http\Controllers\Admin\ShowRoomController;
use App\Http\Controllers\Admin\SliderController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\ReviewController;
use App\Http\Controllers\Admin\PaymentController;
use Illuminate\Support\Facades\Route;

Route::middleware('guest:admin')->group(function(){
    Auth::routes(['register' => false]);
});
Route::middleware('auth:admin')->group(function(){

    Route::get('/' , [DashboardController::class , 'index'])->name('index');
    Route::resource('/brands' , BrandController::class);
    Route::get('/get-districts' , [BranchController::class , 'getDistricts'])->name('get-districts');
    Route::resource('/car-models' , CarModelController::class);
    Route::resource('/city' , CityController::class);
    Route::resource('/color' , ColorController::class);
    Route::resource('/district' , DistrictController::class);
    Route::resource('/role', RoleController::class);
    Route::resource('/admin', AdminController::class);
    Route::resource('/user', UserController::class);
    Route::post('update-password/{user}', [UserController::class ,'updatePassword'])->name('password.update');


    Route::get('/user/cars/{user}', [UserController::class  , 'getCars'])->name('user.cars');
    Route::get('/user/block/{user}',[ UserController::class  , 'blocked'] )->name('block.user');
    Route::resource('/feature', FeatureController::class);
    Route::resource('/{showroom?}/branch', BranchController::class);
    Route::resource('feature/{feature?}/feature_option', FeatureOptionController::class);
    Route::resource('car' , CarController::class);
    Route::get('car/report/{car}' , [ CarController::class , 'report'])->name('car.report');
    Route::post('car/add/report' , [ CarController::class , 'addOrUpdateReport'])->name('car.add.report');
    Route::get('car/hide/{car}' , [CarController::class , 'hide'])->name('car.hide');
    Route::get('car/approve/{car}' , [CarController::class , 'approve'])->name('car.approve');
    Route::get('car/buyed/{car}' , [CarController::class , 'buyed'])->name('car.buyed');
    Route::get('/ads' , [CarController::class , 'allAds'])->name('cars.ads');

    //car plate routs
    Route::get('/plate-ads' , [CarPlateController::class , 'allAds'])->name('carPlates.ads');
    Route::get('plate/hide/{carPlate}' , [CarPlateController::class , 'hide'])->name('carPlate.hide');
    Route::get('plate/approve/{carPlate}' , [CarPlateController::class , 'approve'])->name('carPlate.approve');

    Route::resource('contact' , ContactController::class);

    //showroom or agencies
    Route::resource('/showroom', ShowRoomController::class);
    Route::get('/showroom/cars/{showroom}', [ShowRoomController::class  , 'getCars'])->name('showroom.cars');
    Route::get('/showroom/block/{showroom}',[ ShowRoomController::class  , 'blocked'] )->name('block.showroom');
    Route::get('/showroom/block/{showroom}',[ ShowRoomController::class  , 'hidden'] )->name('block.showroom');
    Route::get('/showroom/approve/{showroom}',[ ShowRoomController::class  , 'approved'] )->name('approve.showroom');

    Route::resource('/requests',RequestController::class);
    Route::post('/request/approve',[ RequestController::class  , 'approved'] )->name('approve.request');

    Route::resource('report' , ReportController::class);
    Route::resource('report/{report?}/report_option', ReportOptionController::class);

    Route::resource('car_type', CarTypeController::class);

    /************************************* Reviews *********************************************************/
    Route::get('reported_reviews', [ReviewController::class, 'reportReviews'])->name('review.reported');
    Route::get('delete_review/{review}', [ReviewController::class, 'destroy'])->name('review.delete');


    /************************************* Notifications *********************************************************/

    Route::resource('push_notification' ,  PushNotificationController::class);
    Route::resource('package' ,  PackageController::class);

    /************************************* Payment *********************************************************/
    Route::resource('payment' ,  PaymentController::class);

    //pages
    Route::get('pages/{page}' , [PageController::class , 'index'])->name('pages.index');
    Route::put('pages/{page}' , [PageController::class , 'update'])->name('pages.update');
    Route::resource('/slider' , SliderController::class );

    /************************************ setting ************************************************/
    Route::controller(SettingController::class)->group(function () {
        Route::group(['prefix' => 'setting', 'as' => 'setting.'], function () {
            //home
            Route::get('/setting-home',  'homeForm')->name('form.home');
            Route::post('/setting-home',  'updateHome')->name('update.home');
            //social
            Route::get('/setting-social',  'socialForm')->name('form.social');
            Route::post('/setting-social',  'updateSocial')->name('update.social');
            //Features
            Route::get('/setting-feature',  'FeatureForm')->name('form.feature');
            Route::post('/setting-feature',  'updateFeature')->name('update.feature');
        });
    });
    /************************************ setting ************************************************/

    Route::post('/logout', [LoginController::class , 'logout' ])->name('logout');

});

Route::post('/user/fcm-token', [UserController::class  , 'updateToken'])->name('user.fcmToken');
Route::get('verify-user-email/{user}', [SettingController::class, 'userEmailVerification'])->name('userEmailVerification');
Route::get('verify-showroom-email/{showroom}', [SettingController::class, 'showroomEmailVerification'])->name('showroomEmailVerification');
Route::get('payment_status', [SettingController::class, 'paymentStatus'])->name('payment.status');



