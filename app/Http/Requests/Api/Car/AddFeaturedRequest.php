<?php

namespace App\Http\Requests\Api\Car;

use App\Http\Requests\Api\ApiRequest;
use Illuminate\Validation\Rule;

class AddFeaturedRequest extends ApiRequest
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
            'ad_type'    => ['required', Rule::in(['basic','featured'])],
        ];
    }

    public function messages(): array
    {
        return [
            'ad_type.required'       => __('mobileValidation.ad_type_required'),
            'ad_type.in'             => __('mobileValidation.ad_type_in'),
        ];
    }

}
