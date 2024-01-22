<?php 

namespace App\Services;

use App\Models\Branch;
use App\Models\Showroom;
use App\Models\User;

class UserService {

    public function getData(array $data ,int $paginate = 15 )
    {
        return  User::orderBy('id', 'desc' )->paginate($paginate);
    }

    public function update($user , $data)
    {
        $user->update($data);
        if(isset($data['image'])){
            $user->updateFile($data['logo'] , '-logo');
        } 
        return $user;
    }

}