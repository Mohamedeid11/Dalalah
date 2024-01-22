<?php

namespace App\Http\Requests\Admin\District;

use Illuminate\Foundation\Http\FormRequest;

class StoreDistrictRequest extends FormRequest
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
            'name.*'=>'required',
            'city_id' => 'required|exists:cities,id',
        ];
    }

}
