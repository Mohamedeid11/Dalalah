<?php

namespace Database\Seeders;

use App\Models\Brand;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class BrandSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Brand::create([
            'name' => ['en'=> 'bmw' , 'ar' => 'bmw'],
            ]
        );
        Brand::create([
            'name' => ['en'=> 'hyundai' , 'ar' => 'hyundai'],
            ]
        );
          Brand::create([
            'name' => ['en'=> 'mercedes' , 'ar' => 'mercedes'],
            ]
        );
    }
}