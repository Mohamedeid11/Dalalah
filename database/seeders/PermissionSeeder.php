<?php

namespace Database\Seeders;

use App\Models\Admin;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class PermissionSeeder extends Seeder
{

    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('roles')->delete();
        DB::table('model_has_roles')->delete();
        DB::table('model_has_permissions')->delete();

        app()['cache']->forget('spatie.permission.cache');

        $adminRole  =  Role::create(['guard_name' => 'admin','name' => 'admin']);

        $adminPermissions = [

            // users
            'admins.read',
            'admins.create',
            'admins.edit',
            'admins.delete',

            // roles
            'roles.read',
            'roles.create',
            'roles.edit',
            'roles.delete',

            //brands
            'brands.read',
            'brands.create',
            'brands.edit',
            'brands.delete',

            //colors
            'colors.read',
            'colors.create',
            'colors.edit',
            'colors.delete',

            //sliders
            'sliders.read',
            'sliders.create',
            'sliders.edit',
            'sliders.delete',

            //pages
            'pages.read',
            'pages.create',
            'pages.edit',
            'pages.delete',

            //car models
            'car_models.read',
            'car_models.create',
            'car_models.edit',
            'car_models.delete',

            //car Types
            'car_types.read',
            'car_types.create',
            'car_types.edit',
            'car_types.delete',

            //cities
            'cities.read',
            'cities.create',
            'cities.edit',
            'cities.delete',

            //districts
            'districts.read',
            'districts.create',
            'districts.edit',
            'districts.delete',

            //feature
            'features.read',
            'features.create',
            'features.edit',
            'features.delete',

            //feature_options
            'feature_options.read',
            'feature_options.create',
            'feature_options.edit',
            'feature_options.delete',

            //reports
            'reports.read',
            'reports.create',
            'reports.edit',
            'reports.delete',

            //report_options
            'report_options.read',
            'report_options.create',
            'report_options.edit',
            'report_options.delete',

            //showrooms
            'showrooms.read',
            'showrooms.create',
            'showrooms.edit',
            'showrooms.delete',
            'showrooms.listCars',

            //branches
            'branches.read',
            'branches.create',
            'branches.edit',
            'branches.delete',

            //cars
            'cars.read',
            'cars.create',
            'cars.edit',
            'cars.delete',

            //users
            'users.read',
            'users.create',
            'users.edit',
            'users.delete',

            //users
            'packages.read',
            'packages.create',
            'packages.edit',
            'packages.delete',

            //requests
            'requests.read',
            'requests.approve',

            //contact
            'contact.read',
            'contact.show',

            //push_notification
            'push_notification.read',
            'push_notification.create',
            'push_notification.delete',

            //settings
            'setting.read',
            // 'setting.create',
            'setting.edit',
            // 'setting.delete',

            //cars
            'plate.read',
            'plate.create',
            'plate.edit',
            'plate.delete',

            //cars
            'review.read',
            'review.create',
            'review.edit',
            'review.delete',

            //payment
            'payment.read',
            'payment.create',
            'payment.edit',
            'payment.delete',

        ];

        foreach ($adminPermissions as $permission) {
            Permission::firstOrCreate(['guard_name' => 'admin','name' => $permission]);
        }
        $adminRole->givePermissionTo($adminPermissions);
        $admin = Admin::find(1);
        if($admin){
            $admin->assignRole('admin');
        }

    }

}
