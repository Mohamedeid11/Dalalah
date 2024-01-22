<?php

namespace App\Http\Requests\Api\Request;

use App\Http\Requests\Api\ApiRequest;
use Illuminate\Validation\Rule;

class TrackRequestRequest extends ApiRequest
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
            'phone'          => 'required|exists:requests,phone',
        ];  
    }

    public function messages(): array
    {
        return [ 
            'phone.required'         => __('mobileValidation.phone_required'),
            'phone.exists'           => __('mobileValidation.phone_exists'),
        ];
    }
    
}
