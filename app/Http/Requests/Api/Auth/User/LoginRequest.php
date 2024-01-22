<?php

namespace App\Http\Requests\Api\Auth\User;

use App\Http\Requests\Api\ApiRequest;

class LoginRequest extends ApiRequest
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
            'email'           => 'required|email|exists:users,email',
            'password'        => 'required|min:6',
            'fcm_token'       => 'nullable',
        ];
    }

    public function messages(): array
    {
        return [
            'email.required'    => __('mobileValidation.email_required'),
            'email.email'       => __('mobileValidation.email_email'),
            'email.exists'      => __('mobileValidation.wrong_email'),
            'password.required' => __('mobileValidation.password_required'),
            'password.min'      => __('mobileValidation.password_min'),
        ];
    }

}
