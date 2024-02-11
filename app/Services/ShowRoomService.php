<?php

namespace App\Services;

use App\Models\Branch;
use App\Models\Package;
use App\Models\Showroom;
use Illuminate\Support\Arr;
use Termwind\Components\Dd;


class ShowRoomService {

    public function getData(array $data ,int $paginate = 15 )
    {
        return  Showroom::with('media')->orderBy('id', 'desc' )->paginate($paginate);
    }
    public function getShowroom($id )
    {
        return  Showroom::findOrFail($id);
    }

    public function getShowRoomData(array $data ,int $paginate = 15 , $order = 'desc')
    {
        return  Showroom::with('media')->hidden(0)->orderBy('id', $order )->where('type','showroom')->paginate($paginate);
    }

    public function getAgencyData(array $data ,int $paginate = 15 , $order = 'desc')
    {
        return  Showroom::with('media')->hidden(0)->orderBy('id', $order )->where('type','agency')->paginate($paginate);
    }

    public function getWithoutPaginateBranches($showroom)
    {
        return Branch::where('showroom_id' ,$showroom->id)->get();
    }

    public function store(array $data)
    {
        if (isset($data['expired_date'])){
            $data['expired_date'] = $this->handlePackageExpired($data);
        }
        $showroom = Showroom::create($data);
        $this->uploadNewFile($showroom , $data);
        return $showroom;
    }

    public function update($showroom , $data)
    {
        $showroom->update(Arr::except($data ,'code'));

        $this->uploadExistsFile($showroom , $data);

        if(isset($data['package_id'])){
            if($showroom->package_id  != $data['package_id']){
                $data['expired_date']  =  $this->handlePackageExpired($data);
            }
        }
        return $showroom;
    }

    public function delete($showroom)
    {
        $showroom->deleteFiles();
        return $showroom->delete();
    }

    public function handlePackageExpired($data)
    {
        $package     = Package::findOrFail($data['package_id']);
        $expiredData = now()->today()->addMonths($package->period);
        return $expiredData->toDateString();
    }

    public function uploadExistsFile($showroom ,$data)
    {
        if(isset($data['logo'])){
            $showroom->updateFile($data['logo'] , '-logo');
        }
        if(isset($data['image'])){
            $showroom->updateFile($data['image'] , '-logo');
        }
        if(isset($data['tax_card'])){
            $showroom->updateFile($data['tax_card'] , '-tax_card');
        }
        if(isset($data['cover_image'])){
            $showroom->updateFile($data['cover_image'] , '-cover_image');
        }
        if(isset($data['commercial'])){
            $showroom->updateFile($data['commercial'] , '-commercial');
        }
    }

    public function uploadNewFile($showroom ,$data)
    {
        if(isset($data['logo'])){
            $showroom->storeFile($data['logo'] , '-logo');
        }
        if(isset($data['image'])){
            $showroom->storeFile($data['image'] , '-logo');
        }
        if(isset($data['tax_card'])){
            $showroom->storeFile($data['tax_card'] , '-tax_card');
        }
        if(isset($data['cover_image'])){
            $showroom->storeFile($data['cover_image'] , '-cover_image');
        }
        if(isset($data['commercial'])){
            $showroom->storeFile($data['commercial'] , '-commercial');
        }
    }

}
