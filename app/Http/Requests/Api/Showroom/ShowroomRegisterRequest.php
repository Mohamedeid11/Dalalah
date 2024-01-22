<?php

namespace App\Http\Requests\Api\Showroom;

use App\Http\Requests\Api\ApiRequest;

class ShowroomRegisterRequest extends ApiRequest
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
            'name_en'           => 'required',
            'name_ar'           => 'required',
            'owner_name_en'     => 'required',
            'owner_name_ar'     => 'required',
            'description_en'    => 'nullable',
            'description_ar'    => 'nullable',
            'email'             => 'required|email',
            'phone'             => 'required',
            'whatsapp'          => 'required',
            'password'          => 'required|min:8',
            'city_id'           => 'required|exists:cities,id',
            'district_id'       => 'required|exists:districts,id',
            'logo'              => 'required|image|mimes:svg,png,jpg,webp,jpeg',
            'cover_image'       => 'nullable|image|mimes:svg,png,jpg,webp,jpeg',
        ];
    }

    public function messages(): array
    {
        return [
            'name_en.required'          => __('mobileValidation.showroom_name_required'),
            'name_ar.required'          => __('mobileValidation.showroom_name_required'),
            'owner_name_en.required'    => __('mobileValidation.owner_name_required'),
            'owner_name_ar.required'    => __('mobileValidation.owner_name_required'),
            'description_en.required'   => __('mobileValidation.description_required'),
            'description_ar.required'   => __('mobileValidation.description_required'),
            'email.required'            => __('mobileValidation.phone_required'),
            'email.email'               => __('mobileValidation.phone_required'),
            'phone.required'            => __('mobileValidation.phone_required'),
            'whatsapp.required'         => __('mobileValidation.whatsapp_required'),
            'password.required'         => __('mobileValidation.password_required'),
            'password.min'              => __('mobileValidation.password_min'),
            'city_id.required'          => __('mobileValidation.city_id_required'),
            'city_id.exists'            => __('mobileValidation.city_id_exists'),
            'district_id.required'      => __('mobileValidation.district_id_required'),
            'district_id.exists'        => __('mobileValidation.district_id_exists'),
            'logo.required'             => __('mobileValidation.logo_required'),
        ];
    }

}
