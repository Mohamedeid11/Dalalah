<?php

namespace App\Http\Requests\Api\Reviews;

use App\Http\Requests\Api\ApiRequest;

class StoreReviewRequest extends ApiRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return auth('end-user-api')->check() || auth('showroom-api')->check() ;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'body'      => 'required|string',
            'car_id'    => 'nullable|exists:cars,id',
            'plate_id'  => 'nullable|exists:car_plates,id',
        ];
    }

    public function messages(): array
    {
        return [
            'body.required'     => __('mobileValidation.body_required'),
            'body.string'       => __('mobileValidation.body_string'),
            'car_id.required'   => __('mobileValidation.car_id_required'),
            'car_id.exists'     => __('mobileValidation.car_id_exists'),
        ];
    }
}
