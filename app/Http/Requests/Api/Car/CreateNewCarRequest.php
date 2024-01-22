<?php

namespace App\Http\Requests\Api\Car;

use App\Http\Requests\Api\ApiRequest;

class CreateNewCarRequest extends ApiRequest
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
            'brand_id'               => 'required|exists:brands,id',
            'car_model_id'           => 'required|exists:car_models,id',
            'car_model_extension_id' => 'required|exists:car_model_extensions,id',
            'year'                   => 'required',
        ];
    }

    public function messages(): array
    {
        return [
            'brand_id.required'                 => __('mobileValidation.brand_id_required'),
            'brand_id.exists'                   => __('mobileValidation.brand_id_exists'),
            'car_model_id.required'             => __('mobileValidation.car_model_id_required'),
            'car_model_id.exists'               => __('mobileValidation.car_model_id_exists'),
            'car_model_extension_id.required'   => __('mobileValidation.car_model_extension_id_required'),
            'car_model_extension_id.exists'     => __('mobileValidation.car_model_extension_id_exists'),
            'year.required'                     => __('mobileValidation.year_required'),

        ];
    }

}
