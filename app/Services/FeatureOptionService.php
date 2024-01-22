<?php 

namespace App\Services;

use App\Models\FeatureOption;
use Illuminate\Support\Arr;


class FeatureOptionService {

    public function getData(array $data ,int $paginate = 15, $feature)
    {
        return  FeatureOption::orderBy('id','desc')->where('feature_id' , $feature->id)->paginate($paginate);
    }

    public function store(array $data)
    {
        $featureOption =  FeatureOption::create(Arr::except($data , 'icon'));
        
        if(isset($data['icon'])){
            $featureOption->storeFile($data['icon'] , '-icon');
        }
        return $featureOption ;
    }

    public function update($featureOption , $data)
    {
        $featureOption->update(Arr::except($data , 'icon'));
        if(isset($data['icon'])){
            $featureOption->updateFile($data['icon'] , '-icon');
        }
        return $featureOption;
    }

    public function delete($featureOption)
    {
        return  $featureOption->delete();
    }

}