<?php

namespace App\Http\Requests\Api\Payment;

use App\Http\Requests\Api\ApiRequest;
use Illuminate\Validation\Rule;

class PackagePaymentRequest extends ApiRequest
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
            'package_id'    => 'required|exists:packages,id',
            'PaymentId'     => 'required',
            'Result'        => 'required',
            'amount'        => 'required',
            'PaymentType'   => 'required',
        ];
    }

    public function messages(): array
    {
        return [
            'package_id.exists'     => __('mobileValidation.package_id_exists'),
            'package_id.required'   => __('mobileValidation.package_id_required'),
            'payment_id.required'   => __('mobileValidation.result_required'),
            'Result.required'       => __('mobileValidation.Result_required'),
            'amount.required'       => __('mobileValidation.payment_type_required'),
            'PaymentType.required'  => __('mobileValidation.PaymentType_required'),
        ];
    }

}
