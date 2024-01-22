<?php

namespace App\Http\Requests\Api\Car;

use App\Http\Requests\Api\ApiRequest;
use Illuminate\Validation\Rule;

class UpdateCarRequest extends ApiRequest
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
            'brand_id'                => 'nullable|exists:brands,id',
            'car_model_id'            => 'nullable|exists:car_models,id',
            'car_model_extension_id'  => 'nullable|exists:car_model_extensions,id',
            'branch_id'               => 'nullable|exists:branches,id',
            'car_type_id'             => 'nullable|exists:car_types,id',
            'year'                    => 'nullable',
//            'color_id'                => 'required|exists:colors,id',
            'color'                   => 'sometimes|string|min:3|max:20',
            'drive_type'              => ['nullable', Rule::in(['manual', 'automatic'])],
            'fuel_type'               => ['nullable', Rule::in(['gasoline', 'diesel' , 'electrical' , 'hybrid'])],
            'price'                   => ['nullable'],
            'doors'                   => ['nullable', Rule::in(['2', '3' ,'4' ,'6'])],
            'engine'                  => 'nullable',
            'cylinders'               => 'nullable',
            'mileage'                 => 'nullable',
            'description'             => 'nullable',
            'features'                => 'nullable|array',
            'main_image'              => 'nullable',
            'monthly_installment'     => 'nullable|integer',
            'images'                  => 'nullable',
        ];
    }

}
