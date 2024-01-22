<?php

namespace Database\Seeders;

use App\Models\Page;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PageSeeder extends Seeder
{

    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('pages')->delete();
        
        Page::create([
            'name' => ['en'=> 'About Us', 'ar'=>'من نحن'],
            'slug' => 'about-us',
        ]);

        Page::create([
            'name' => ['en'=> 'Terms And Conditions', 'ar' => 'الشروط والاحكام'],
            'slug' => 'terms-and-conditions',
        ]);
        
        Page::create([
            'name' => ['en'=> 'Privacy Policy', 'ar' => 'سياسة الخصوصية'],
            'slug' => 'privacy-policy',
        ]);
    }
    
}
