<?php

namespace App\Http\Requests\Api\Contact;

use App\Http\Requests\Api\ApiRequest;

class StoreContactRequest extends ApiRequest
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
            'subject'   => 'required|string',
            'content'      => 'required|string',
        ];
    }

    public function messages(): array
    {
        return [
            'subject.required'  => __('mobileValidation.body_required'),
            'subject.string'    => __('mobileValidation.body_string'),
            'content.required'     => __('mobileValidation.body_required'),
            'content.string'       => __('mobileValidation.body_string'),
        ];
    }
}
