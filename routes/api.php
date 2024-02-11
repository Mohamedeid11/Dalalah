<?php

use App\Http\Controllers\Api\Auth\Showroom\LoginController;
use App\Http\Controllers\Api\Auth\Showroom\ProfileController;
use App\Http\Controllers\Api\Auth\Showroom\ShowroomProfileController;
use App\Http\Controllers\Api\Auth\User\LoginController as UserLoginController;
use App\Http\Controllers\Api\Auth\User\RegisterController as UserRegisterController;
use App\Http\Controllers\Api\Auth\User\UserProfileController;
use App\Http\Controllers\Api\BranchController;
use App\Http\Controllers\Api\BrandController;
use App\Http\Controllers\Api\CarController;
use App\Http\Controllers\Api\ColorController;
use App\Http\Controllers\Api\RatingController;
use App\Http\Controllers\Api\NotificationController;
use App\Http\Controllers\Api\RequestController;
use App\Http\Controllers\Api\SettingController;
use App\Http\Controllers\Api\ShowroomController;
use App\Http\Controllers\Api\SliderController;
use App\Http\Controllers\Api\PaymentController;
use App\Http\Controllers\Api\ReviewController;
use App\Http\Controllers\Api\CarPlateController;
use App\Http\Controllers\Api\FollowController;
use App\Http\Controllers\Api\ContactController;
use App\Models\Showroom;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Symfony\Component\HttpKernel\Profiler\Profile;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

/***************************** Showroom Account ************************************/
Route::get('get_agencies', [ShowroomController::class , 'getAllAgencies']);
Route::get('get_showrooms', [ShowroomController::class , 'getAllShowrooms']);
Route::get('get_showroom/{id}', [ShowroomController::class , 'getShowroom']);
Route::get('showroom_cars/{id}', [ShowroomController::class , 'getShowroomCars']);
Route::get('brands', [BrandController::class , 'getBrands']);
Route::get('colors', [ColorController::class , 'index']);
Route::get('get_brands', [BrandController::class , 'index']);
Route::get('brand_models/{brand}', [BrandController::class , 'getBrandModels']);
Route::get('brand_model_extensions/{carModel}', [BrandController::class , 'getBrandModelExtension']);

Route::get('get_cars', [CarController::class , 'index']);
Route::get('get_my_cars', [CarController::class , 'getMyCars']);
Route::get('get_plates', [CarPlateController::class , 'index']);
Route::get('show_plate/{carPlate}', [CarPlateController::class , 'show']);
Route::get('showroom_plates', [CarPlateController::class , 'showroomPlates']);
Route::get('car/get/buyed/{car}', [CarController::class , 'carGetBuyed']);
Route::get('get_admin_cars', [CarController::class , 'getAdminCars']);


//Guest Routes
Route::middleware('guest:end-user-api')->group(function(){
    //end-user
    Route::post('end-user/register' , [UserRegisterController::class , 'create']);
    Route::post('end-user/login' , [UserLoginController::class , 'login']);

    // Review
    Route::get('get-review' , [ReviewController::class , 'index']);
    Route::post('add_rate' , [RatingController::class , 'store']);

    Route::post('installment_calculation' ,[CarController::class , 'InstallmentCalculation'] );
    Route::get('installment_filter' ,[CarController::class , 'installmentFilter'] );
});

//auth Routes
Route::middleware('auth:end-user-api')->group(function(){

    //get profile
    Route::get('get-user' , [UserProfileController::class , 'getUser']);
    Route::post('edit-user' , [UserProfileController::class , 'editUser']);
    Route::post('edit-user-image' , [UserProfileController::class , 'updateProfileImage']);

    //logout-endUser
    Route::post('end-user/logout' , [UserLoginController::class , 'logout']);

    //follow
    Route::post('follow_showroom/{id}' , [FollowController::class , 'followShowroom']);
    Route::post('unfollow_showroom/{id}' , [FollowController::class , 'unfollowShowroom']);
    Route::get('followed_showroom' , [FollowController::class , 'getFollowedShowrooms']);


    //Request Price
    Route::post('price_request/{car}' , [RequestController::class , 'priceRequest']);
    Route::get('get_price_requests' , [RequestController::class , 'getpriceRequest']);

    /******** Contact us or support ***********/
    Route::post('support' , [ContactController::class, 'store']);

});

//Guest Showroom Routes
Route::middleware('guest:showroom-api')->group(function(){
    Route::post('showroom/register' , [ShowroomProfileController::class , 'create']);
    Route::post('showroom/login' , [LoginController::class , 'login']);
});

//Auth Showroom Routes
Route::middleware('auth:showroom-api')->group(function(){

    Route::post('add_branch' , [BranchController::class , 'store']);
    Route::get('showroom/branches' , [BranchController::class , 'index']);
    Route::post('edit_branch/{branch}'  , [BranchController::class , 'update']);
    Route::post('hide_branch/{branch}'  , [BranchController::class , 'hideBranch']);

    //get profile
    Route::get('get-showroom' , [ShowroomProfileController::class , 'getShowroom']);
    Route::post('edit-showroom' , [ShowroomProfileController::class , 'editShowroom']);
    Route::post('edit-showroom-image' , [ShowroomProfileController::class , 'updateProfileImage']);

    //logout-showroom
    Route::post('showroom/logout' , [LoginController::class , 'logout']);

    /* Add New Car */
    Route::get('get-admin-cars' , [CarController::class , 'createNewCar']);
    Route::post('add-new-car' , [CarController::class , 'storeNewCar']);

    /********   Payment          ********/
    Route::post('package_payment' , [PaymentController::class , 'PackagePayment'])->name('payment.package');
    Route::get('packages' , [PaymentController::class , 'getPackages'])->name('packages');

});

//Auth Showroom Routes
Route::middleware('apiUserCheck')->group(function(){
    Route::post('add_car_feature' , [CarController::class , 'featuredCar']);
    Route::post('add_car' , [CarController::class , 'store']);
    Route::delete('delete_car/{car}' , [CarController::class , 'delete']);
    Route::post('edit_car/{car}' , [CarController::class , 'update']);
    Route::post('hide_car/{car}' , [CarController::class , 'hideOrUnHide']);
    Route::post('edit_car_images' , [CarController::class , 'updateImages']);
    Route::delete('delete_image/{id}' , [CarController::class , 'deleteImage']);
    Route::post('is_sold/{car}' , [CarController::class , 'soldStatus']);


    //Car Plate Routs
    Route::post('add-car-plate' , [CarPlateController::class , 'store']);
    Route::post('edit-car-plate' , [CarPlateController::class , 'update']);
    Route::delete('delete_car_plate/{carPlate}' , [CarPlateController::class , 'destroy']);
    Route::post('hide_plate/{carPlate}' , [CarPlateController::class , 'hideOrUnHide']);
    Route::post('sold_plate/{carPlate}' , [CarPlateController::class , 'soldStatus']);
    Route::get('my-plates' , [CarPlateController::class , 'showUserPlates']);
    Route::post('add_plate_feature' , [CarPlateController::class , 'featuredPlate']);



    Route::post('deleteAccount' , [SettingController::class , 'deleteAccount']);

    //Review
    Route::post('add-review' , [ReviewController::class , 'store']);
    Route::get('show-review/{review}' , [ReviewController::class , 'show']);
    Route::post('edit_review/{review}' , [ReviewController::class , 'update']);
    Route::delete('delete_review/{review}' , [ReviewController::class , 'destroy']);
    Route::post('report-review/{review}' , [ReviewController::class , 'reportReview']);

    // Favorite
    Route::get('get-favorite' , [UserProfileController::class , 'getEndUserFavorite']);
    Route::post('add-favorite' , [UserProfileController::class , 'addOrDeleteFavorite']);
    Route::get('get-favorite-plates' , [UserProfileController::class , 'getEndUserFavoritePlates']);

    /********   Payment          ********/
    Route::post('featured_payment' , [PaymentController::class , 'featuredPayment'])->name('payment.featured');

});

//get car
Route::get('show_car/{car}' , [CarController::class , 'show']);

/****************** Setting ****************** */
Route::get('setting' , [SettingController::class , 'getCarMaxPice']);
Route::get('drive_types' , [SettingController::class , 'getDriveTypes']);
Route::get('body_types' , [SettingController::class , 'getBodyTypes']);
Route::get('fuel_types' , [SettingController::class , 'getFuelTypes']);
Route::get('car_status' , [SettingController::class , 'getCarStatus']);
Route::get('years' , [SettingController::class , 'getYears']);
Route::get('features' , [SettingController::class , 'getFeatures']);
Route::get('cities' , [SettingController::class , 'getCities']);
Route::get('districts/{id}' , [SettingController::class , 'getDistricts']);
Route::post('sell_or_trade_car' , [RequestController::class , 'store']);
Route::post('track_your_request' , [RequestController::class , 'trackRequest']);
Route::get('sliders' , [SliderController::class ,'index'] );

Route::get('ad-feature' , [SettingController::class , 'geAdFeature']);

//pages
Route::get('about-us' , [SettingController::class , 'getAboutPage']);
Route::get('terms-and-conditions' , [SettingController::class , 'getTermsAndConditionsPage']);
Route::get('privacy' , [SettingController::class , 'getPrivacyPage']);
Route::get('buying-and-selling-privacy' , [SettingController::class , 'getBuyingAndSellingPrivacyPage']);
Route::get('ContactUs' , [SettingController::class , 'ContactUs']);

Route::get('branch/{showroom}' , [BranchController::class , 'show']);
Route::post('test_notification' , [SettingController::class , 'testNotification']);
Route::get('all_notification' , [NotificationController::class , 'index']);

Route::get('success-payment' , [PaymentController::class , 'success'])->name('payment.success');

Route::post('reset-password' , [SettingController::class , 'resetPassword'])->name('reset.password');

Route::get('payment-status' , [SettingController::class , 'paymentStatus'])->name('payment.showPayment');
