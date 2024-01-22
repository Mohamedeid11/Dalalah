<?php

namespace App\Services;

use App\Models\CarModel;
use App\Models\CarModelExtension;
use App\Models\CarModelYear;

class CarModelService {

    public function getData(array $data ,int $paginate = 15)
    {
        return  CarModel::filter($data)->orderBy('id','desc')->paginate($paginate);
    }

    public function store(array $data)
    {
        $carModel =  CarModel::create($data);
        foreach($data['years'] as $year){
            CarModelYear::create([ 'year' => $year , 'car_model_id' => $carModel->id]);
        }
        $this->handleExtensions($data['extensions'] , $carModel);

        return $carModel;
    }

    public function update($carModel , $data)
    {
        $carModel->update($data);
        $carModel->years()->delete();
        foreach($data['years'] as $year){
            CarModelYear::create([ 'year' => $year , 'car_model_id' => $carModel->id]);
        }

        // $carModel->extensions()->delete();
        $this->handleExtensions($data['extensions'] , $carModel);

        return $carModel;
    }

    public function delete($carModel)
    {
        return $carModel->delete();
    }

    public function handleExtensions($extensions , $carModel)
    {
        $extensions = json_decode($extensions , true);

        if($extensions){
            foreach($extensions as $key =>  $extension){
                $ids[] =  CarModelExtension::firstOrCreate(['name'=>strtolower(str_replace(' ' , '-', $extension['value']))])->id;
            }
            $carModel->extensions()->sync($ids);
        }
    }

}
