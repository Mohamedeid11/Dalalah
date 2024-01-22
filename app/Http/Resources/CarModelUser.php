<?php

namespace App\Http\Resources;

use App\Models\Showroom;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Spatie\Permission\Commands\Show;


class CarModelUser extends JsonResource
{
    
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id'            =>  $this->id,
            'name'          =>  isset($this->name) ? $this->name : $this->showroom_name,
            'phone'         =>  $this->phone,
            'whatsapp'      =>  isset($this->whatsapp) ? $this->whatsapp : $this->phone,
            'count_cars'    =>  count($this->cars()->where('is_hide',0)->get()),
            'description'   =>  isset($this->description) ? $this->description : '',
            'image'         =>  $this->getLogo(),
            'cover_image'   =>  $this->getFirstMediaUrl('showrooms-cover_image') == null 
                                ? '' 
                                : $this->getFirstMediaUrl('showrooms-cover_image'),
        ];
    }
    
}
