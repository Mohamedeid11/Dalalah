<?php

namespace App\Http\Requests\Api\Auth\User;

use App\Http\Requests\Api\ApiRequest;
use App\Rules\DistrictRegister;
use Illuminate\Validation\Rule;

class UserEditProfileRequest extends ApiRequest
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
        $user = auth('end-user-api')->user();
        return [
            'name'         => 'sometimes|string|max:255|unique:users,name,'.$user->id,
            'email'        => 'sometimes|email|unique:users,email,'.$user->id,
            'password'     => ['sometimes','min:6'],
            'image'        => 'nullable|image|mimes:jpg,jpeg,png,gif|max:1024',
            'phone'        => 'nullable|unique:users,phone,'.$user->id,
            'whatsapp'     => 'nullable|unique:users,whatsapp,'.$user->id,
            'city_id'      => 'sometimes|exists:cities,id',
            // 'role'         => ['required', Rule::in(['job-user', 'end-user'])],
            // 'fcm_token'    => 'required',
        ];
    }

    public function messages(): array
    {
        return [
            'name.required'               => __('mobileValidation.name_required'),
            'name.unique'                 => __('mobileValidation.name_unique'),
            'email.required'              => __('mobileValidation.email_required'),
            'email.email'                 => __('mobileValidation.email_email'),
            'email.unique'                => __('mobileValidation.email_unique'),
            'phone.required'              => __('mobileValidation.phone_required'),
            'phone.unique'                => __('mobileValidation.phone_unique'),
            'password.required'           => __('mobileValidation.password_required'),
            'password.min'                => __('mobileValidation.password_min'),
            'password.confirmed'          => __('mobileValidation.password_confirmed'),
            'image.required'              => __('mobileValidation.image_required'),
            'image.image'                 => __('mobileValidation.image_image'),
        ];
    }

}
