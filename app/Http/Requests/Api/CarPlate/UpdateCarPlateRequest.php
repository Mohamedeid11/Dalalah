<?php

namespace App\Http\Requests\Api\CarPlate;

use App\Http\Requests\Api\ApiRequest;
use Illuminate\Validation\Rule;

class UpdateCarPlateRequest extends  ApiRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return auth()->guard('end-user-api')->check() || auth('showroom-api')->check();
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        $id = $this->route('id');
        return [
            'id'                    => 'sometimes|exists:car_plates,id',
            'city_id'               => 'sometimes|exists:cities,id',
            'district_id'           => 'sometimes|exists:districts,id',
            'letter_ar'             => 'sometimes|max:10|unique:car_plates,letter_ar,' .$id,
            'letter_en'             => 'sometimes|max:10|unique:car_plates,letter_en,' . $id,
            'plate_number'          => 'sometimes|numeric|unique:car_plates,plate_number,' . $id,
            'price'                 => ['sometimes'],
            'plate_type'            => ['sometimes', Rule::in(['transfer', 'private'])],
            'ad_type'               => ['nullable', Rule::in(['regular', 'special'])],
        ];
    }

    public function messages(): array
    {
        return [
            'id.exists'       => __('mobileValidation.car_plate_id_exists'),
            'city_id.required'      => __('mobileValidation.city_id_required'),
            'city_id.in'            => __('mobileValidation.city_id_exists'),
            'district_id.required'  => __('mobileValidation.district_id_required'),
            'district_id.exists'    => __('mobileValidation.district_id_exists'),
            'letter_ar.required'    => __('mobileValidation.letter_ar_required'),
            'letter_ar.max'         => __('mobileValidation.letter_ar_max'),
            'letter_ar.unique'      => __('mobileValidation.letter_ar_unique'),
            'letter_en.required'    => __('mobileValidation.letter_en_required'),
            'letter_en.max'         => __('mobileValidation.letter_en_max'),
            'letter_en.unique'      => __('mobileValidation.letter_en_unique'),
            'plate_number.numeric' => __('mobileValidation.plate_number_numeric'),
            'plate_number.required' => __('mobileValidation.plate_number_required'),
            'plate_number.exists'   => __('mobileValidation.plate_number_exists'),
            'price.required'        => __('mobileValidation.price_required'),
            'plate_type.required'   => __('mobileValidation.plate_type_required'),
            'plate_type.in'         => __('mobileValidation.plate_type_in'),
        ];
    }
}
