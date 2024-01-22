<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class SameCarsResource extends JsonResource
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
            'id'                    => $this->id,
            'model_role'            => $this->getUserType(),
            'showroom'             => new ShowroomResource($this->showroom),
            'branch'                => $this->getBranchObject(),
            'city'                  => $this->getCityObject(),
            'price'                 => $this->getPrice(),
            'monthly_installment'   => $this->monthly_installment,
            'description'           => $this->getDescription(),
            'main_image'            => $this->getLogo(),
            'images'                => $this->getImages(),
        ];
    }

}
