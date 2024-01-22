<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class CarModelAdmin extends JsonResource
{
    
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id'            => $this->request?->id ?? $this->model_id,
            'name'          => $this->request?->name ?? 'admin',
            'phone'         => $this->request?->phone ?? setting('phone','en'),
            'whatsapp'      => $this->request?->phone ?? setting('phone','en'),
            'count_cars'    => '',
            'description'   => '',
            'image'         => asset('end-user/assets/img/logo/logo-nav.png'),
        ];
    }
    
}
