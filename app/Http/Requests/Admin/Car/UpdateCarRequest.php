<?php

namespace App\Http\Requests\Admin\Car;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdateCarRequest extends FormRequest
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
        //    'title.*'          =>'required',
           'brand_id'               => 'required|exists:brands,id',
           'car_model_id'           => 'required|exists:car_models,id',
           'car_model_extension_id' => 'required|exists:car_model_extensions,id',
           'car_type_id'    => 'required|exists:car_types,id',
           'year'           => 'required',
           'color'          => 'nullable',
           'color_id'       => 'required|exists:colors,id',
//            'status'         => ['required', Rule::in(['new', 'used'])],
            'status'         => 'new',
           'drive_type'     => ['required', Rule::in(['manual', 'automatic'])],
        //    'body_type'      => ['required', Rule::in(['hatchback', 'sedan'])],
            'fuel_type'      => ['nullable', Rule::in(['gasoline', 'diesel' , 'electrical' , 'hybrid'])],
           'price'          => ['required'],
           'doors'          => ['nullable', Rule::in(['2', '3' ,'4' ,'6'])],
           'engine'         => 'required',
           'cylinders'      => 'required',
//           'mileage'        => 'nullable',
           'description'    => 'nullable',
           'features'       => 'nullable|array',
           'main_image'     => 'nullable',
           'door-1'         => 'nullable',
           'door-2'         => 'nullable',
           'door-3'         => 'nullable',
           'door-4'         => 'nullable',
           'images'         => 'nullable',
        ];
    }

}
