<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ContactFormResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
          'id'          => $this->id,
          'name'        => $this->name,
          'email'       => $this->email,
          'phone'       => $this->phone,
          'subject'     => $this->subject,
          'content'     => $this->content,
          'created_at'  => $this->created_at->format('Y-m-d'),
          'updated_at'  => $this->updated_at->format('Y-m-d'),
        ];
    }
}
