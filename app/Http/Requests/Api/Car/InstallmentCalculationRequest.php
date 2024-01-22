<?php

namespace App\Http\Requests\Api\Car;

use App\Http\Requests\Api\ApiRequest;
use App\Rules\CheckUserAddCar;
use Illuminate\Validation\Rule;

class InstallmentCalculationRequest extends ApiRequest
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
            'gross_salary'      => 'required|integer',
            'personal_finance'  => 'nullable|integer',
            'mortgage'          => 'nullable|integer',
            'credit_card'       => 'nullable|integer',
        ];
    }

    public function messages(): array
    {
        return [
            'gross_salary.required'         => __('mobileValidation.gross_salary'). __('mobileValidation.required'),
            'gross_salary.integer'          => __('mobileValidation.gross_salary') . __('mobileValidation.integer'),
            'personal_finance.integer'      => __('mobileValidation.personal_finance') . __('mobileValidation.integer'),
            'mortgage.integer'              => __('mobileValidation.mortgage') . __('mobileValidation.integer'),
            'credit_card.integer'           => __('mobileValidation.credit_card') . __('mobileValidation.integer'),
        ];
    }

}
