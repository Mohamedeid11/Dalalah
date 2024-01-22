<?php

namespace App\Http\Requests\Api\Showroom;

use App\Http\Requests\Api\ApiRequest;

class ShowroomLoginRequest extends ApiRequest
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
            'code'            => 'required|exists:showrooms,code' ,
            'password'        => 'required|min:6' ,
            'fcm_token'       => 'nullable' ,
        ];
    }

    public function messages(): array
    {
        return [
            'code.required'     => __('mobileValidation.code_required'),
            'code.exists'       => __('mobileValidation.wrong_code'),
            'password.required' => __('mobileValidation.password_required'),
            'password.min'      => __('mobileValidation.password_min'),
        ];
    }

}
