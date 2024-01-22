<?php 

namespace App\Services;

use App\Models\Restaurant\Restaurant;
use App\Models\User;
use App\Models\User\UserGiftCode;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;
use PhpParser\Node\Expr\Cast\Double;
use Ramsey\Uuid\Type\Decimal;


class EndUserService {

    public function getData(array $data ,int $paginate = 15)
    {
        return  User::filter($data)->orderBy('id','desc')->paginate($paginate);
    }

    public function store(array $data)
    {
        $endUser =  User::create(Arr::except($data , 'image') );
        if(isset($data['image'])){
            $endUser->storeFile($data['image'],'-logo');
        }
        return $endUser;
    }

    public function update($endUser ,$data)
    {
        if(isset($data['image'])){
            $endUser->updateFile($data['image'],'-logo');
        }
        $endUser->update(Arr::except($data , 'image'));
        return $endUser;
    }
   
}