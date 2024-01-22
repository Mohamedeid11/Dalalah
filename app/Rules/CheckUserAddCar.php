<?php

namespace App\Rules;

use App\Models\Showroom;
use App\Models\User;
use Closure;
use Illuminate\Contracts\Validation\ValidationRule;

class CheckUserAddCar implements ValidationRule
{

    /**
     * Run the validation rule.
     *
     * @param  \Closure(string): \Illuminate\Translation\PotentiallyTranslatedString  $fail
     */
    public function validate(string $attribute, mixed $value, Closure $fail): void
    {
        if($value == 'user'){
            $user = User::find(request()->model_id);
            if(!$user){
                $fail(__('mobileValidation.user_id_not_found'));
            }
            if(request()->status != 'used'){
                $fail(__('mobileValidation.user_cannot_add_new_car'));
            }
        }elseif($value == 'agency'){
            $agency = Showroom::where('id',request()->model_id)->where('type',$value)->first();
            if(!$agency){
                $fail(__('mobileValidation.agency_id_not_found'));
            }
            if($value == 'agency' &&  request()->status != 'new'){
                $fail(__('mobileValidation.agency_cannot_add_used_car'));
            }
        }elseif($value == 'showroom'){
            $showroom = Showroom::where('id',request()->model_id)->where('type',$value)->first();
            if(!$showroom){
                $fail(__('mobileValidation.showroom_id_not_found'));
            }
            if($value == 'showroom' &&  request()->status != 'used'){
                $fail(__('mobileValidation.you_cannot_add_new_car_from_here'));
            }
        }
    }

}
