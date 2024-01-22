<?php

namespace App\Http\Requests\Api;

use App\Http\Requests\Api\ApiRequest;
use Illuminate\Validation\Rule;

class QueryRequest extends ApiRequest
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
            'limit' => ['nullable', 'numeric', 'max:30'],
            'order' => ['nullable', Rule::in(['asc', 'desc'])],
        ];  
    }

    public function messages(): array
    {
        return [ 
            'limit.numeric'     => __('mobileValidation.limit_numeric'),
            'limit.max'         => __('mobileValidation.limit_max'),
            'order.in'          => __('mobileValidation.order_in'),
        ];
    }
    
}
