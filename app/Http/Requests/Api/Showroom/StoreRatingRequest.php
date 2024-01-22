<?php

namespace App\Http\Requests\Api\Showroom;

use App\Http\Requests\Api\ApiRequest;
use App\Rules\CheckUserAddCar;
use Illuminate\Validation\Rule;

class StoreRatingRequest extends ApiRequest
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
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'showroom_id'   => 'required|exists:showrooms,id',
            'rate'          => 'required|integer|max:5|min:1',
        ];
    }

    public function messages(): array
    {
        return [
            'rate.required'         => __('site.rate')      . __('mobileValidation.required'),
            'rate.integer'          => __('site.rate')      . __('mobileValidation.integer'),
            'showroom_id.required'  => __('site.showroom')  . __('mobileValidation.required'),
            'showroom_id.exists'    => __('site.showroom')  . __('mobileValidation.exists'),
            ];
    }
}
