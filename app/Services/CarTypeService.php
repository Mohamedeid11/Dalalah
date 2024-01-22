<?php 

namespace App\Services;

use App\Models\CarType;
use Illuminate\Support\Arr;

class CarTypeService {

    public function getData(array $data ,int $paginate = 15)
    {
        return  CarType::orderBy('id','desc')->paginate($paginate);
    }

    public function store(array $data)
    {
        $carType =  CarType::create(Arr::only($data , 'name'));
        if(isset($data['icon'])){
            $carType->storeFile($data['icon'] , '-icon');
        }
        return $carType;
    }

    public function update($carType , $data)
    {
        $carType->update(Arr::only($data , 'name'));
        if(isset($data['icon'])){
            $carType->updateFile($data['icon'] , '-icon');
        }
        return $carType;
    }

    public function delete($carType)
    {
        return $carType->delete();
    }

}