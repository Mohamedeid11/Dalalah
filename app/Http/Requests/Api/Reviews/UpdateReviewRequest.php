<?php

namespace App\Http\Requests\Api\Reviews;

use App\Http\Requests\Api\ApiRequest;

class UpdateReviewRequest extends ApiRequest
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
            'body'      => 'nullable|string',
        ];
    }

    public function messages(): array
    {
        return [
            'body.string'       => __('mobileValidation.body_string'),
        ];
    }
}
