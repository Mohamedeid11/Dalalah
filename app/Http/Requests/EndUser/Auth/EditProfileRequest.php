<?php

namespace App\Http\Requests\EndUser\Auth;

use App\Http\Requests\Api\ApiRequest;
use App\Rules\DistrictRegister;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class EditProfileRequest extends FormRequest
{
   
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\Rule|array|string>
     */
    public function rules(): array
    {
        return [
            'name'         => 'required|max:255',
            // 'email'        => 'required|email|unique:users,email,'.auth('end-user')->user()->id,
            'phone'        => ['sometimes','regex:/^((01))[0-9]{9}/'
                                ,'unique:users,phone,'.auth('end-user')->user()->id],
            // 'password'     => ['required', 'min:6', 'confirmed'],
            'city_id'      => 'required|exists:cities,id',
            'district_id'  => 'required|exists:districts,id',
            'image'        => 'nullable|image|mimes:jpg,jpeg,png,gif|max:1024', 
        ];
    }

    public function messages(): array
    {
        return [ 
            'name.required'          => __('mobileValidation.name_required'),
            'name.max'               => __('mobileValidation.name_max'),
            'name.unique'            => __('mobileValidation.name_unique'),
            'email.required'         => __('mobileValidation.email_required'),
            'email.email'            => __('mobileValidation.email_email'),
            'email.unique'           => __('mobileValidation.email_unique'),
            'password.required'      => __('mobileValidation.password_required'),
            'password.min'           => __('mobileValidation.password_min'),
            'password.confirmed'     => __('mobileValidation.password_confirmed'),
            'phone.required'         => __('mobileValidation.phone_required'),
            'phone.unique'           => __('mobileValidation.phone_unique'),
        ];
    }
    
}
