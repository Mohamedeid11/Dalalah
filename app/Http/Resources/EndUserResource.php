<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class EndUserResource extends JsonResource
{

    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $data = [
            'id'                => $this->id,
            'name'              => $this->name,
            'email'             => $this->email,
            'phone'             => $this->phone ?? '',
            'whatsapp'             => $this->whatsapp ?? '',
            'role'              => 'user',
            'image'             => $this->getLogo(),
            'city'             => new CityResource($this->city),
        ];

        //get token
        if($request->path() == 'api/end-user/login'  || $request->path() == 'api/end-user/register'){
            $data['token']  = $this->getToken();
        }

        return $data;
    }

}
