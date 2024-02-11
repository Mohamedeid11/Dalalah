<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\CarTypeResource;
use App\Http\Resources\CityResource;
use App\Http\Resources\FeatureResource;
use App\Http\Resources\PageResource;
use App\Mail\EmailVerification;
use App\Mail\ResetPasswordMail;
use App\Models\Car;
use App\Models\CarType;
use App\Models\City;
use App\Models\District;
use App\Models\Feature;
use App\Models\Page;
use App\Models\Showroom;
use App\Models\User;
use App\Services\Firebase;
use Carbon\Carbon;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class SettingController extends Controller
{

    public function getDriveTypes()
    {
        return $this->returnJSON(getDriveTypes());
    }

    public function getBodyTypes()
    {
        $carTypes = CarType::get();
        return $this->returnJSON(CarTypeResource::collection($carTypes));
    }

    public function getFuelTypes()
    {
        return $this->returnJSON(getFuelTypes());
    }

    public function getCarStatus(Request $request)
    {
        if (Auth::guard('showroom-api')->check()) {
           if(Auth::guard('showroom-api')->user()->type == 'showroom'){
                return $this->returnJSON(getCarStatus());
            }
            else{
                return $this->returnJSON(getCarStatusNew());
            }
        }
        elseif (Auth::guard('end-user-api')->check()) {
            return $this->returnJSON(getCarStatusUsed());
        } else{
            return $this->returnJSON(getCarStatus());
        }
    }

    public function getYears()
    {
        return $this->returnJSON(range(Carbon::now()->addYear(5)->year, 1990));
    }

    public function getFeatures()
    {
        $features = Feature::get();
        return $this->returnJSON(FeatureResource::collection($features));
    }

    public function getCities()
    {
        $cities = City::get();
        return $this->returnJSON(CityResource::collection($cities));
    }


    public function getDistricts($id)
    {
        $districts = District::where('city_id',$id)->get();
        return $this->returnJSON(CityResource::collection($districts));
    }

    public function getCarMaxPice()
    {
        $maxPrice = Car::max('price');
        $minPrice = Car::min('price');
        if($maxPrice){
            return $this->returnJSON([
                'car_max_price' => (float) $maxPrice,
                'car_min_price' => (float) $minPrice,
            ]);
        }
        return $this->returnJSON(['car_min_price'=> 0 ,'car_max_price' => 0]);
    }

    public function getAboutPage()
    {
        $page = Page::where('slug','about-us')->first();
        return $this->returnJSON(new PageResource($page));
    }

    public function getTermsAndConditionsPage()
    {
        $page = Page::where('slug','terms-and-conditions')->first();
        return $this->returnJSON(new PageResource($page));
    }

    public function getPrivacyPage()
    {
        $page = Page::where('slug','privacy-policy')->first();
        return $this->returnJSON(new PageResource($page));
    }

    public function getBuyingAndSellingPrivacyPage()
    {
        $page = Page::where('slug','buying-and-selling-policy')->first();
        return $this->returnJSON(new PageResource($page));
    }

    public function testNotification(Request $request)
    {
        $request->validate(['fcm_token'=>'required'] );
        Firebase::send('test notification title' , 'test notification body',[],'',['type'=>'general'],
        $request->fcm_token);
        return $this->returnSuccess();
    }

    public function ContactUs(){
        return $this->returnJSON([
            'address' => setting('address'),
            'phone'   => setting('phone','en'),
            'email'   => setting('email','en'),
        ]);
    }

    public function geAdFeature(){
        return $this->returnJSON([
            'feature_basic_duration'    => setting('feature_basic_duration','en'),
            'feature_duration'          => setting('feature_duration','en'),
            'feature_duration_price'    => setting('feature_duration_price','en'),
        ]);
    }

    public function deleteAccount(){
        if (Auth::guard('showroom-api')->check()) {
            $showroom = Showroom::findOrFail(Auth::guard('showroom-api')->user()->id);
            $showroom->delete();
        }
        elseif (Auth::guard('end-user-api')->check()) {
            $user = User::findOrFail(Auth::guard('end-user-api')->user()->id);
            $user->delete();
        }
        return $this->returnSuccess('User Deleted Successfully');
    }

    public function resetPassword(Request $request){
        if ($request->user_type == 'showroom'){
            $user = Showroom::where('email', $request->email)->first();
        }elseif ($request->user_type == 'user'){
            $user = user::where('email' , $request->email)->first();
        }

        if (isset($user)){
//            $newPassword = Str::random(6); // You can adjust the password length as needed
//            $user->update(['password' => $newPassword]);

//            Mail::to($user->email)->send(new ResetPasswordMail($user ,$newPassword ));

            return $this->returnSuccess('your new password has been sent to your email');
        }else{
            return $this->returnWrong('wrong email');
        }

    }

    public function paymentStatus(){

        return $this->returnJSON([
            'is_hide' => !setting('show_payment','en'),
        ]);
    }
}
