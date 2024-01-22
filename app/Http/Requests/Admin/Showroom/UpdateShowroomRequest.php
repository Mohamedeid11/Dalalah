<?php

namespace App\Http\Requests\Admin\Showroom;

use Illuminate\Foundation\Http\FormRequest;

class UpdateShowroomRequest extends FormRequest
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
            'owner_name.*'    => 'required',
            'showroom_name.*' => 'required',
            'description.*'   => 'required',
            'phone'           => 'required',
            'whatsapp'        => 'required',
            'end_tax_card'    => 'required',
            'password'        => 'nullable|min:8',
            'type'            => 'required',
//            'package_id'      => 'nullable|exists:packages,id',
            'logo'            => 'nullable|image|mimes:svg,png,jpg,webp,jpeg',
            'tax_card'        => 'nullable|image|mimes:svg,png,jpg,webp,jpeg',
            'commercial'      => 'nullable|image|mimes:svg,png,jpg,webp,jpeg',
            'cover_image'     => 'nullable|image|mimes:svg,png,jpg,webp,jpeg',
        ];
    }

}
