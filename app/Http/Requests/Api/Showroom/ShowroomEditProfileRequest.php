<?php

namespace App\Http\Requests\Api\Showroom;

use App\Http\Requests\Api\ApiRequest;

class ShowroomEditProfileRequest extends ApiRequest
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
            'name_en'           => 'nullable',
            'name_ar'           => 'nullable',
            'owner_name_en'     => 'nullable',
            'owner_name_ar'     => 'nullable',
            'description_en'    => 'nullable',
            'description_ar'    => 'nullable',
            'email'             => 'nullable|email',
            'phone'             => 'nullable',
            'whatsapp'          => 'nullable',
            'end_tax_card'      => 'nullable',
            'tax_card'          => 'nullable',
            'password'          => 'nullable|min:8',
            'city_id'           => 'nullable|exists:cities,id',
            'district_id'       => 'nullable|exists:districts,id',
            'logo'              => 'nullable|image|mimes:svg,png,jpg,webp,jpeg',
            'cover_image'       => 'nullable|image|mimes:svg,png,jpg,webp,jpeg',
        ];
    }

    public function messages(): array
    {
        return [
            'email.email'               => __('mobileValidation.phone_required'),
            'password.min'              => __('mobileValidation.password_min'),
            'city_id.exists'            => __('mobileValidation.city_id_exists'),
            'district_id.exists'        => __('mobileValidation.district_id_exists'),
        ];
    }

}
