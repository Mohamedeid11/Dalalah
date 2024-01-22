<?php 

namespace App\Services;

use App\Models\Brand;
use App\Models\CarModel;
use App\Models\CarModelExtension;

class BrandService {

    public function getData(array $data ,int $paginate = 15)
    {
        return  Brand::orderBy('id','desc')->paginate($paginate);
    }

    public function getWithoutPaginateBrands()
    {
        return  Brand::get();
    }

    public function getBrandModels($brand)
    {
        return CarModel::where('brand_id', $brand->id)->get();
    }

    public function getBrandModelExtensions($model)
    {
        return CarModelExtension::where('car_model_id', $model->id)->get();
    }

    public function store(array $data)
    {
        $brand =  Brand::create($data);
        if($data['image']){
            $brand->storeFile($data['image']);
        }
        return $brand;
    }

    public function update($brand , $data)
    {
        if(isset($data['image'])){
            $brand->updateFile($data['image']);
        }
        $brand->update($data);
        return $brand;
    }

    public function delete($brand){
        $brand->deleteFiles();
        return $brand->delete();
    }

}