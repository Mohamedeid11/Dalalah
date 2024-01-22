<?php 

namespace App\Services;

use App\Models\Brand;
use App\Models\CarModel;
use App\Models\CarModelExtension;
use App\Models\Pacakge;
use App\Models\Package;

class PackageService {

    public function getData(array $data ,int $paginate = 15)
    {
        return  Package::orderBy('id','desc')->paginate($paginate);
    }

    public function store(array $data)
    {
        return  Package::create($data);
    }

    public function update($package , $data)
    {
        $package->update($data);
        return $package;
    }

    public function delete($package)
    {
        return $package->delete();
    }

}