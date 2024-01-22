<?php 

namespace App\Services;

use App\Models\City;
use App\Models\District;

class DistrictService {

    public function getData(array $data ,int $paginate = 15){
        return  District::orderBy('id','desc')->paginate($paginate);
    }

    public function store(array $data){
       return  District::create($data);
    }

    public function update($district , $data){
        $district->update($data);
        return $district;
    }

    public function delete($district){
        return $district->delete();
    }
}