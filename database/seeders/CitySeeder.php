<?php

namespace Database\Seeders;

use App\Models\City;
use App\Models\District;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CitySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        City::create([
            'name' => ['en'=> 'city1' , 'ar' => 'city1'],
            ]
        );
        City::create([
            'name' => ['en'=> 'city2' , 'ar' => 'city2'],
            ]
        );

        District::create([
            'name' => ['en'=> 'District1' , 'ar' => 'District1'],
            'city_id' => 1,
            ]
        );
        
        District::create([
            'name' => ['en'=> 'District2' , 'ar' => 'District2'],
            'city_id' => 1,
            ]
        );

        District::create([
            'name' => ['en'=> 'District3' , 'ar' => 'District3'],
            'city_id' => 2,
            ]
        );
        
        District::create([
            'name' => ['en'=> 'District4' , 'ar' => 'District4'],
            'city_id' => 2,
            ]
        );
    }
}
