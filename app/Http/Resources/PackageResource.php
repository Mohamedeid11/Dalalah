<?php

namespace App\Http\Resources;

use App\Models\FeatureOption;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PackageResource extends JsonResource
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
            'period'      => $this->period,
            'price'      => $this->price,
            'description'      => $this->description,
            'created_at'      => $this->created_at->format('Y-m-d'),
        ];
    }

}
