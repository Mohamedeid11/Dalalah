<?php

namespace App\Http\Requests\Api\Car;

use App\Http\Requests\Api\ApiRequest;
use App\Rules\CheckUserAddCar;
use Illuminate\Validation\Rule;

class StoreCarRequest extends ApiRequest
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
            'model_id'       => 'required|integer',
            'model_role'     => ['required', new CheckUserAddCar() ,  Rule::in(['showroom', 'agency','user'])],
            'brand_id'               => 'required|exists:brands,id',
            'car_model_id'           => 'required|exists:car_models,id',
            'car_model_extension_id' => 'required|exists:car_model_extensions,id',
            'car_type_id'    => 'required|exists:car_types,id',
            'branch_id'      => 'nullable|exists:branches,id',
            'year'           => 'required',
//            'color_id'       => 'required|exists:colors,id',
            'color'          => 'required|string|min:3|max:20',
            'drive_type'     => ['required', Rule::in(['manual', 'automatic'])],
            'fuel_type'      => ['required', Rule::in(['gasoline', 'diesel' , 'electrical' , 'hybrid'])],
            'status'         => ['required', Rule::in(['new', 'used' ])],
            'doors'          => ['nullable', Rule::in(['2', '3' ,'4' ,'6'])],
            'ad_type'        => ['nullable', Rule::in(['basic','featured'])],
            'price'          => ['required'],
            'engine'         => 'nullable',
            'cylinders'      => 'required',
            'mileage'        => 'nullable',
            'description'    => 'nullable',
            'features'       => 'required|array',
            'main_image'     => 'required',
            'images'         => 'nullable',
        ];
    }

    public function messages(): array
    {
        return [
            'model_id.required'       => __('mobileValidation.model_id_required'),
            'model_id.integer'        => __('mobileValidation.model_id_integer'),
            'model_role.required'     => __('mobileValidation.model_role_required'),
            'model_role.in'           => __('mobileValidation.model_role_in'),
            'brand_id.required'                 => __('mobileValidation.brand_id_required'),
            'brand_id.exists'                   => __('mobileValidation.brand_id_exists'),
            'car_model_id.required'             => __('mobileValidation.car_model_id_required'),
            'car_model_id.exists'               => __('mobileValidation.car_model_id_exists'),
            'car_model_extension_id.required'   => __('mobileValidation.car_model_extension_id_required'),
            'car_model_extension_id.exists'     => __('mobileValidation.car_model_extension_id_exists'),
            'year.required'                     => __('mobileValidation.year_required'),
            'car_type_id.required'   => __('mobileValidation.car_type_id_required'),
            'car_type_id.exists'     => __('mobileValidation.car_type_id_exists'),
            'branch_id.required'     => __('mobileValidation.branch_id_required'),
            'branch_id.exists'       => __('mobileValidation.branch_id_exists'),
            'color_id.required'      => __('mobileValidation.color_id_required'),
            'color_id.exists'        => __('mobileValidation.color_id_exists'),

            'drive_type.required'    => __('mobileValidation.drive_type_required'),
            'drive_type.in'          => __('mobileValidation.drive_type_in'),
            'fuel_type.required'     => __('mobileValidation.fuel_type_required'),
            'fuel_type.in'           => __('mobileValidation.fuel_type_in'),
            'status.required'        => __('mobileValidation.status_required'),
            'status.in'              => __('mobileValidation.status_in'),
            'ad_type.required'       => __('mobileValidation.ad_type_required'),
            'ad_type.in'             => __('mobileValidation.ad_type_in'),
            'doors.required'         => __('mobileValidation.doors_required'),
            'doors.in'               => __('mobileValidation.doors_in'),
            'price.required'         => __('mobileValidation.price_required'),
//            'engine.required'        => __('mobileValidation.engine_required'),
            'cylinders.required'     => __('mobileValidation.cylinders_required'),
            'main_image.required'    => __('mobileValidation.main_image_required'),
            'features.required'      => __('mobileValidation.features_required'),
        ];
    }

}
