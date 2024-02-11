<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ShowroomResource extends JsonResource
{

    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {

        $user_id = auth('end-user-api')->check() ? auth('end-user-api')->user()->id : null ;
        $data =  [
            'id'            => $this->id,
//            'owner_name'    => $this->owner_name,
//            'name'          => $this->showroom_name,
//            'description'   => $this->description,
            'owner_name_ar' => $this->getTranslation('owner_name','ar'),
            'owner_name_en' => $this->getTranslation('owner_name','en'),
            'name_ar'       => $this->getTranslation('showroom_name','ar'),
            'name_en'       => $this->getTranslation('showroom_name','en'),
            'description_en'=> $this->getTranslation('description','en'),
            'description_ar'=> $this->getTranslation('description','ar'),
            'email'         => $this->email,
            'code'          => $this->code,
            'phone'         => $this->phone,
            'whatsapp'      => $this->whatsapp,
            'end_tax_card'  => $this->end_tax_card,
            'role'          => $this->type,
            'count_cars'    =>  count($this->cars->where('is_hide',0)),
            'avg_rate'      => $this->rate ? $this->avgRate  : '',
            'city'          => new CityResource($this->city),
            'address'       => $this->getAddress(),
            'is_blocked'    => $this->isBlocked(),
            'is_hide'       => $this->is_hide == 1 ? true : false,
            'followers'     => $this->followers->count(),
            'is_followed'   => $this->followers->contains($user_id),
            'image'         => $this->getLogo(),
            'cover_image'   => $this->getCoverImage(),
        ];

        //get token
        if($request->path() == 'api/showroom/login'){
            $data['token']  = $this->getToken();
        }

        return $data;
    }

}
