<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Str;

class CarPlateResource extends JsonResource
{

    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $user = auth()->guard('end-user-api')->user();
        return [
            'id'                => $this->id,
            'letter_ar'         => $this->letter_ar,
            'letter_en'         => Str::upper($this->letter_en),
            'plate_number'      => $this->plate_number,
            'price'             => $this->getPrice(),
            'plate_type'        => $this->plate_type,
            'bought_status'     => $this->bought_status,
            'ad_type'           => $this->ad_type,
            'address'           => $this->getAddress(),
            'is_featured'           => $this->ad_type == 'featured' ? true : false,
            'is_hide'           => $this->is_hide == 1 ? true : false,
            'is_paused'         => $this->is_paused == 1 ? true : false,
            'is_approved'       => $this->is_approved == 1 ? true : false,
            'is_favorite'       =>  ($user && $user->favoritPLates->contains($this->id)) ? true : false,
            'created_at'        => $this->getCreatedAt(),
            'city'              => new CityResource($this->city),
            'user'              => new EndUserResource($this->user),
            'showroom'          => new ShowroomResource($this->showroom),

        ];
    }

}
