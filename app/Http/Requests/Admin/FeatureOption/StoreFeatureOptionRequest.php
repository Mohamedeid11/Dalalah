<?php

namespace App\Http\Requests\Admin\FeatureOption;

use Illuminate\Foundation\Http\FormRequest;

class StoreFeatureOptionRequest extends FormRequest
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
            'feature_id' => 'required|exists:features,id',
            'icon' => 'nullable|mimes:jpeg,jpg,png,gif',
        ];
    }
}
