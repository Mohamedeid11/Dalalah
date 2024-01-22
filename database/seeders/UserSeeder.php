<?php

namespace Database\Seeders;

use App\Models\Admin;
use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $user = User::updateOrCreate(
            ['id' => 1],[
            'name'     => 'user',
            'email'    => 'user@admin.com',
            'password' => 'password',
        ]);

        $user = User::updateOrCreate(
            ['id' => 12],[
            'name'           => "please don't delete",
            'email'          => 'mahmoudsalah@test.com',
            'register_from'  => 'mobile',
            'phone'          => '01006445971',
            'password'       => '12345678',
        ]);


        $admin = Admin::updateOrCreate(
            ['id' => 1]
            ,[
            'name'     => 'admin',
            'email'    => 'admin@admin.com',
            'password' => '1234',
        ]);
        $admin->assignRole('admin');        
    }
}
