<?php 

namespace App\Services;

use App\Models\Page;

class PageService {

    public function getPageWithSlug($page , array $data ,int $paginate = 15)
    {
        return  Page::where('slug',$page)->first();
    }

    public function update($page , $data)
    {
        if(isset($data['image'])){
            $page->updateFile($data['image']);
        }
        $page->update($data);
        return $page;
    }

    // public function delete($page)
    // {
    //     $page->deleteFiles();
    //     return $page->delete();
    // }

}