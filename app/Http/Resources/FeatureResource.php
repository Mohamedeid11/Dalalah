<?php

namespace App\Http\Resources;

use App\Models\FeatureOption;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class FeatureResource extends JsonResource
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
            'options'   => FeatureOptionResource::collection($this->options), 
        ];
    }

}
