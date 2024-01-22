<?php 

namespace App\Services;

use App\Models\Color;
use Illuminate\Support\Arr;


class ColorService {

    public function getData(array $data ,int $paginate = 15)
    {
        return  Color::orderBy('id','desc')->paginate($paginate);
    }

    public function store(array $data)
    {
        $color =  Color::create($data);
        return $color;
    }

    public function update($color ,$data)
    {
        $color->update($data);
        return $color;
    }

    public function delete($color)
    {
        $color->delete();
    }

}