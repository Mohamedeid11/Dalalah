<?php

namespace App\Http\Requests\Showroom\Branch;

use Illuminate\Foundation\Http\FormRequest;

class StoreBranchRequest extends FormRequest
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
            'name.*'      =>'required',
            'address.*'   =>'nullable',
            'city_id'     => 'required|exists:cities,id',
            'district_id' => 'required|exists:districts,id',
            'showroom_id' => 'required|exists:showrooms,id',
            'phone'       => ['sometimes','regex:/^((01))[0-9]{9}/'],
            'link'        => 'required',
            'image'       =>'required|image|mimes:svg,png,jpg,webp,jpeg',
        ];
    }

}
