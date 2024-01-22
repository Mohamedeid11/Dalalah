<?php 

namespace App\Services;

use App\Models\Feature;


class FeatureService {

    public function getData(array $data ,int $paginate = 15)
    {
        return  Feature::orderBy('id','desc')->paginate($paginate);
    }

    public function store(array $data)
    {
      return Feature::create($data);
    }

    public function update($feature , $data)
    {
        $feature->update($data);
        return $feature;
    }

    public function delete($feature)
    {
        return $feature->delete();
    }

}