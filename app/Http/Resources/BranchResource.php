<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class BranchResource extends JsonResource
{

    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id'        => $this->id,
            'name'      => $this->name,
            'city'      => $this->city->name,
            'district'  => $this->district->name,
            'phone'     => $this->phone ?? '',
            'whatsapp'  => $this->whatsapp ?? '',
            'cityId'    => $this->city_id,
            'districtId'=> $this->district_id,
            'link'      => $this->link,
            'address'   => $this->getAddress(),
        ];
    }

}
