<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class AdminCarResource extends JsonResource
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
            'model_role'         => 'admin',
            'model_object'       => $this->getModelObjectUser(),
            // 'title'              => $this->title,
            'brand'              => $this->getBrandObject(),
            'brandModel'         => $this->getBrandModelObject(),
            'brandModelExtension'=> $this->getBrandModelExtensionObject(),
            'branch'             => $this->getBranchObject(),
            'year'               => $this->year,
            'color'              => $this->getColorObject(),
            'drive_Type'         => $this->getDriveType(),
            'body_Type'          => $this->getBodyType(),
            'fuel_Type'          => $this->getFuelType(),
            'status'             => $this->getCarStatus(),
            'is_buyed'           => $this->status_buyed == 'buyed' ? true : false,
            'price'              => $this->getPrice(),
            'doors'              => $this->doors,
            'engine'             => $this->engine,
            'cylinders'          => $this->cylinders,
            'mileage'            => $this->mileage,
            'description'        => $this->getDescription(),
            'main_image'         => $this->getLogo(),
            'images'             => $this->getImages(),
            'door1_img'          => $this->getImageDoor1(),
            'door2_img'          => $this->getImageDoor2(),
            'door3_img'          => $this->getImageDoor3(),
            'door4_img'          => $this->getImageDoor4(),
            'features'           => $this->getFeaturesWithOptions(),
            'reports'            => $this->getReportsWithOptions(),
        ];
    }

}
