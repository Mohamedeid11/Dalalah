<?php

namespace App\Http\Requests\Api\Car;

use App\Http\Requests\Api\ApiRequest;
use Illuminate\Validation\Rule;

class UpdateImagesRequest extends ApiRequest
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
            'car_id'    => 'nullable|exists:cars,id',
            'image'     => 'nullable|image',
            'image_id'  => 'nullable|exists:media,id',
        ];
    }

    public function messages(): array
    {
        return [
            'car_id.required'   => __('mobileValidation.car_id_required'),
            'car_id.exists'     => __('mobileValidation.car_id_exists'),
        ];
    }

}