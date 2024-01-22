<?php 

namespace App\Services;

use App\Models\Brand;
use App\Models\City;

class CityService {

    public function getData(array $data ,int $paginate = 15){
        return  City::orderBy('id','desc')->paginate($paginate);
    }

    public function store(array $data){
       return  City::create($data);
    }

    public function update($city , $data){
        $city->update($data);
        return $city;
    }

    public function delete($city){
        return $city->delete();
    }
}