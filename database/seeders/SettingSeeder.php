<?php

namespace Database\Seeders;

use App\Models\Setting;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SettingSeeder extends Seeder
{

   /**
    * Run the database seeds.
   */

   public function run(): void
   {
      DB::table('settings')->delete();

      Setting::create([
         'option' => 'site_logo',
         'value'  => 'http://automobile.matrix-clouds.com/end-user/assets/img/logo/logo-nav.png'
      ]);

      Setting::create([
         'option' => 'phone',
         'value'  => '+97455230817'
      ]);

      Setting::create([
         'option' => 'email',
         'value'  => 'info@autombile.com'
      ]);

      Setting::create([
         'option' => 'address',
         'value'  => ['en' => 'address english' ,'ar' => 'address arabic']
      ]);

      Setting::create([
         'option' => 'facebook',
         'value'  => 'https://www.facebook.com/'
      ]);

      Setting::create([
         'option' => 'twitter',
         'value'  => 'https://twitter.com/'
      ]);

      Setting::create([
         'option' => 'instagram',
         'value'  => 'https://instagram.com/'
      ]);

      Setting::create([
         'option' => 'linkedin',
         'value'  => 'https://linkedin.com/'
      ]);

      Setting::create([
         'option' => 'snapchat',
         'value'  => 'https://snapchat.com/'
      ]);

      Setting::create([
         'option' => 'tiktok',
         'value'  => 'https://tiktok.com/'
      ]);

      Setting::create([
         'option' => 'about_section_title',
         'value'  => 'The Right People for your Business'
      ]);

      Setting::create([
         'option' => 'about_section_content',
         'value'  => 'There are many variations of passages of available but the majority have suffered alteration in some form, by injected humou or randomised words which don look even slightly believable.'
      ]);

      Setting::create([
         'option' => 'about_section_img',
         'value'  => 'http://automobile.matrix-clouds.com/end-user/assets/img/about/01.png'
      ]);

      Setting::create([
         'option' => 'show_section_title',
         'value'  => 'Download AutoMobile App For Free'
      ]);

      Setting::create([
         'option' => 'show_section_content',
         'value'  => 'There are many variations of passages available but the majority have suffered in some form going to use a passage by injected humour.'
      ]);

      Setting::create([
         'option' => 'show_section_img',
         'value'  => 'http://automobile.matrix-clouds.com/end-user/assets/img/download/01.png'
      ]);

      Setting::create([
         'option' => 'about_footer_content',
         'value'  => 'There are many variation of passages of lorem ipsum available, but the majority suffered.'
      ]);

      Setting::create([
         'option' => 'contact_page_title',
         'value'  => 'WRITE US ANY MESSAGE .'
      ]);

      Setting::create([
         'option' => 'contact_page_content',
         'value'  => 'We are committed to providing our customers with exceptional service while offering our employees the best training. There are many variations of passages of lorem ipsum is simply free text available in the market, but the majority have suffered time.'
      ]);
      Setting::create([
         'option' => 'feature_basic_duration',
         'value'  => 0
      ]);
      Setting::create([
         'option' => 'feature_duration',
         'value'  => 0
      ]);
      Setting::create([
         'option' => 'feature_duration_price',
         'value'  => 0
      ]);
      Setting::create([
         'option' => 'show_payment',
         'value'  => 1
      ]);

   }

}
