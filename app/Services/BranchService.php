<?php 

namespace App\Services;

use App\Models\Branch;
use App\Models\Showroom;
use Spatie\Permission\Commands\Show;


class BranchService {

    public function getData(array $data ,int $paginate = 15, $showroom)
    {
        return  Branch::orderBy('id','desc')
                    ->where('showroom_id' , $showroom->id)
                    ->where('is_hide', 0)
                    ->paginate($paginate);
    }
    
    public function getWithoutPaginateBranches($showroom)
    {
        return Branch::where('showroom_id' ,$showroom->id)->where('is_hide', 0)->get();
    }
    
    public function apiStore(array $data)
    {
        $showroom =  Branch::create($data + ['showroom_id' => auth('showroom-api')->user()->id]);
        if(isset($data['image'])){
            $showroom->storeFile($data['image']);
        }
        return $showroom;
    }

    public function store(array $data)
    {
        $showroom =  Branch::create($data);
        if($data['image']){
            $showroom->storeFile($data['image']);
        }
        return $showroom;
    }

    public function update($showroom , $data)
    {
        if(isset($data['image'])){
            $showroom->updateFile($data['image']);
        }
        $showroom->update($data);
        return $showroom;
    }

    public function delete($showroom)
    {
        $showroom->deleteFiles();
        return $showroom->delete();
    }

}