<?php

namespace App\Services;

use App\Models\Contact;
use App\Models\Slider;
use Illuminate\Support\Arr;

class ContactService {

    public function getData(array $data ,int $paginate = 15){
        return  Contact::orderBy('id','desc')->paginate($paginate);
    }


    public function sotreMobileData(array $data){
        return Contact::create($data);
    }
}
