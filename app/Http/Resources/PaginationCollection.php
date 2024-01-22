<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;

class PaginationCollection extends ResourceCollection
{
    
    /**
     * Transform the resource collection into an array.
     *
     * @return array<int|string, mixed>
     */
    public function toArray(Request $request)
    {
        $paginate = json_encode([
            "current_page"    => $this->currentPage(),
            "first_page_url"  =>  $this->getOptions()['path'].'?'.$this->getOptions()['pageName'].'=1',
            "prev_page_url"   =>  $this->previousPageUrl() ?? '',
            "next_page_url"   =>  $this->nextPageUrl()  ?? '',
            "last_page_url"   =>  $this->getOptions()['path'].'?'.$this->getOptions()['pageName'].'='.$this->lastPage(),
            "total_pages"     =>  $this->lastPage(),
            "per_page"        =>  $this->perPage(),
            "total_items"     =>  $this->total(),
            "path"            =>  $this->getOptions()['path'],
        ]);
        return json_decode($paginate);  
    }
    
}
