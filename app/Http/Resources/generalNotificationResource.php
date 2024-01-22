<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class generalNotificationResource extends JsonResource
{
    
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id'       => $this->getIdIncrement(),
            'title'    => $this->getTitle(),
            'message'  => $this->getMessage(),
            'type'     => $this->getTypeNotification(),
            'car_id'   => $this->getNavigateId(),
            // 'role'     => $this->getRole(),
        ];
    }
    
}
