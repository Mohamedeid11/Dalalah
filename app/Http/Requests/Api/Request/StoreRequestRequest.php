<?php

namespace App\Http\Requests\Api\Request;

use App\Http\Requests\Api\ApiRequest;
use Illuminate\Validation\Rule;

class StoreRequestRequest extends ApiRequest
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
            'brand_id'       => 'required|exists:brands,id',
            'car_model_id'   => 'required|exists:car_models,id',
            'car_model_extension_id' => 'required|exists:car_model_extensions,id',
            'year'           => 'required',
            'mileage'        => 'nullable', 
            'city_id'        => 'required|exists:cities,id',
            'name'           => 'required',
            'phone'          => 'required',
        ];  
    }

    public function messages(): array
    {
        return [ 
            'phone.required'                    => __('mobileValidation.phone_required'),
            'name.required'                     => __('mobileValidation.name_required'),
            'year.required'                     => __('mobileValidation.year_required'),
            'city_id.required'                  => __('mobileValidation.city_id_required'),
            'city_id.exists'                    => __('mobileValidation.city_id_exists'),
            'brand_id.required'                 => __('mobileValidation.brand_id_required'),
            'brand_id.exists'                   => __('mobileValidation.brand_id_exists'),
            'car_model_id.required'             => __('mobileValidation.car_model_id_required'),
            'car_model_id.exists'               => __('mobileValidation.car_model_id_exists'),
            'car_model_extension_id.required'   => __('mobileValidation.car_model_extension_id_required'),
            'car_model_extension_id.exists'     => __('mobileValidation.car_model_extension_id_exists'),
        ];
    }
    
}
