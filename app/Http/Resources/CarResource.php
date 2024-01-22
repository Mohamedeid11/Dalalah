<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class CarResource extends JsonResource
{

    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id'                 => $this->id,
            'model_role'         => $this->getUserType(),
            'model_object'       => $this->getModelObjectUser(),
            'brand'              => $this->getBrandObject(),
            'brandModel'         => $this->getBrandModelObject(),
            'brandModelExtension'=> $this->getBrandModelExtensionObject(),
            'branch'             => $this->getBranchObject(),
            'city'               => $this->getCityObject(),
            'year'               => $this->year,
            'color'              => $this->color,
            'drive_Type'         => $this->getDriveType(),
            'body_Type'          => $this->getBodyType(),
            'fuel_Type'          => $this->getFuelType(),
            'status'             => $this->getCarStatus(),
            'ad_type'            => $this->ad_type,
            'expired_at'         => $this->expired_at,
            'is_featured'        => ($this->ad_type == 'featured') ? true : false,
            'is_sold'           => $this->status_buyed == 'sold' ? true : false,
            'is_hide'           => $this->is_hide == 0 ? true : false,
            'is_approved'       => $this->status_buyed == 'approved' ? true : false,
//            'is_favorite'        => ($this->user?->checkFavorite($this->id)) ? true : false,
            'price'              => $this->getPrice(),
            'monthly_installment'=> $this->monthly_installment,
            'doors'              => $this->doors,
            'engine'             => $this->engine,
            'cylinders'          => $this->cylinders,
            'mileage'            => $this->mileage,
            'description'        => $this->getDescription(),
            'main_image'         => $this->getLogo(),
            'images'             => $this->getImages(),
            'features'           => $this->getFeaturesWithOptions(),
        ];
    }

}
