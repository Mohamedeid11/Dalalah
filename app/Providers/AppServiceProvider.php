<?php

namespace App\Providers;

use App\Models\Notification;
use App\Models\Showroom;
use App\Notifications\CarNotification;
use App\Notifications\CarStatusSoldNotification;
use App\Notifications\RequestCarUserNotification;
use App\Observers\NotificationObserver;
use App\Observers\ShowroomObserver;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\Blade;
use Illuminate\Support\ServiceProvider;
use Laravel\Passport\Passport;


class AppServiceProvider extends ServiceProvider
{

    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        // 'App\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Paginator::useBootstrap();

        Blade::if('adminCan',function($permission){
            return auth('admin')->user()->can($permission);
        });

        Showroom::observe(ShowroomObserver::class);

        $this->app->singleton('notifications', function () {
                return Notification::whereIn('type' ,
                [ RequestCarUserNotification::class  , CarStatusSoldNotification::class , CarNotification::class]
                )->orderBy('id_increment','DESC')->get();
        });

        $this->app->singleton('userFavoritesIds', function () {
            return auth('end-user')->user()->favorites()->pluck('car_id')->toArray();
        });
    }

}
