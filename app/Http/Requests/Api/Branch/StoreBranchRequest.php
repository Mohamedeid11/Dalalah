<?php

namespace App\Http\Requests\Api\Branch;

use Illuminate\Foundation\Http\FormRequest;


class StoreBranchRequest extends FormRequest
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
            'name.*'         =>'required',
            'address.*'      =>'nullable',
            'city_id'        => 'required|exists:cities,id',
            'district_id'    => 'required|exists:districts,id',
            'phone'          => 'required',
            'whatsapp'       => 'required',
            'link'           => 'nullable',
            'image'          => 'nullable|image|mimes:svg,png,jpg,webp,jpeg',
        ];
    }

    public function messages(): array
    {
        return [ 
            'name.en.required'       => __('mobileValidation.name_en_required'),
            'name.ar.required'       => __('mobileValidation.name_ar_required'),
            'city_id.required'       => __('mobileValidation.city_id_required'),
            'city_id.exists'         => __('mobileValidation.city_id_exists'),
            'district_id.required'   => __('mobileValidation.district_id_required'),
            'district_id.exists'     => __('mobileValidation.district_id_exists'),
            'phone.required'         => __('mobileValidation.phone_required'),
            'whatsapp.required'      => __('mobileValidation.whatsapp_required'),
            'image.mimes'            => __('mobileValidation.image_mimes'),
            'image.required'         => __('mobileValidation.image_required'),
            'image.image'            => __('mobileValidation.image_image'),
        ];
    }

}
