<?php

namespace App\Models;

use App\Http\Resources\BranchResource;
use App\Http\Resources\BrandModelExtensionResource;
use App\Http\Resources\BrandModelResource;
use App\Http\Resources\BrandResource;
use App\Http\Resources\CarModelAdmin;
use App\Http\Resources\CarModelUser;
use App\Http\Resources\CarTypeResource;
use App\Http\Resources\CityResource;
use App\Http\Resources\ColorResource;
use App\ModelFilters\CarFilter;
use App\Models\Admin;
use App\Models\City;
use App\Models\ReportOption;
use App\Models\Request;
use App\Models\User;
use App\Traits\HandleUploadFile;
use EloquentFilter\Filterable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Cache;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\Permission\Commands\Show;
use Spatie\Translatable\HasTranslations;

class Car extends Model implements HasMedia
{
    use HasFactory  , InteractsWithMedia , HandleUploadFile , Filterable, HasTranslations ;
    public $translatable = ['title'];
    protected $guarded = [];
    protected $routeKeyName = 'car'; // if you have a custom route key name

    public function getImages()
    {
        $images = [];
        if($this->getMedia('cars')){
            foreach($this->getMedia('cars') as $image){
                $images[] = ['id' => $image->id  , 'image' => $image->getUrl() ];
            }
        }
        return $images;
    }

    public function getLogo()
    {
        return  $this->getFirstMediaUrl('cars-logo') == null
                ? asset('end-user/assets/img/logo/dalala-logo.png')
                : $this->getFirstMediaUrl('cars-logo');
    }

    public function getImageDoor1()
    {
        return  $this->getFirstMediaUrl('cars-door-1') == null ? '': $this->getFirstMediaUrl('cars-door-1');
    }

    public function getImageDoor2()
    {
        return  $this->getFirstMediaUrl('cars-door-2') == null ? '': $this->getFirstMediaUrl('cars-door-2');
    }

    public function getImageDoor3()
    {
        return  $this->getFirstMediaUrl('cars-door-3') == null ? '': $this->getFirstMediaUrl('cars-door-3');
    }

    public function getImageDoor4()
    {
        return  $this->getFirstMediaUrl('cars-door-4') == null ? '': $this->getFirstMediaUrl('cars-door-4');
    }

    public function getUserType()
    {
        if($this->model_name == User::class){
            return 'user';
        }elseif($this->model_name == Showroom::class){
            if($this->showroom?->type == 'showroom'){
                 return 'showroom';
            }else{
                return 'agency';
            }
        }else{
            return 'admin';
        }
        return null;
    }

    public function getModelObjectUser(){
        if($this->model_name == User::class){
            return new CarModelUser($this->user);
        }elseif($this->model_name == Showroom::class){
            return new CarModelUser($this->showroom);
        }elseif($this->model_name == Admin::class){
             return new CarModelAdmin($this);
        }
        return null;
    }

    public function getModelObjectUserForWeb()
    {
        if($this->model_name == User::class){
            return ['name' => $this->user?->name ,
            'phone' => $this->user?->phone , 'whatsapp' => $this->user?->whatsapp , 'image' => $this->user?->getLogo()];
        }elseif($this->model_name == Showroom::class){
            return [
                'name' => $this->showroom->showroom_name ,
                'phone'=> $this->showroom->phone ,
                'whatsapp' => $this->showroom->whatsapp ,
                'image' => $this->showroom->getLogo()
            ];
        }elseif($this->model_name == Admin::class){
            return [
                'name'       => 'Dalalah',
                'phone'      => setting('phone' ,'en'),
                'whatsapp'   => setting('phone' ,'en'),
                'image'      => asset('end-user/assets/img/logo/logo-nav.png'),
            ];
        }
        return null;
    }

    public function user()
    {
        return $this->belongsTo(User::class , 'model_id','id');
    }

    public function colorRelation()
    {
        return $this->belongsTo(Color::class , 'color_id','id');
    }

    public function showroom()
    {
        return $this->belongsTo(Showroom::class , 'model_id','id');
    }

    public function brand()
    {
        return $this->belongsTo(Brand::class);
    }

    public function brandModel()
    {
        return $this->belongsTo(CarModel::class , 'car_model_id');
    }

    public function brandModelExtension()
    {
        return $this->belongsTo(CarModelExtension::class , 'car_model_extension_id');
    }

    public function branch()
    {
        return $this->belongsTo(Branch::class);
    }

    public function city()
    {
        return $this->belongsTo(City::class);
    }

    public function district()
    {
        return $this->belongsTo(District::class);
    }

    public function adminCar() : BelongsTo
    {
        return $this->belongsTo(Car::class , 'car_id');
    }

    public function getAddress()
    {
        if($this->branch){
            return $this->branch->city->name . '  , ' . $this->branch->district->name;
        }elseif($this->model_name == Admin::class){
            return 'admin';
        }
        return $this->city?->name . '  , ' . $this->district?->name;
    }

    public function options()
    {
        return $this->belongsToMany(FeatureOption::class , 'car_options')->with(['media' , 'feature']);
    }

    public function reportOptions()
    {
        return $this->belongsToMany(ReportOption::class , 'car_reports')
            ->withPivot('image')
            ->with(['media','report']);
    }

    public function getFeaturesWithOptions()
    {
        $container = [];
        if(count($this->options)){

            foreach($this->options->groupBy('feature_id') as $featureKey => $features){
                $featureKey = count($features) -1 ;
                $featureParent = [];
                $featureParent = [
                    'id'   => isset( $features[$featureKey]) ? $features[$featureKey]->feature_id : '',
                    'name' => isset( $features[$featureKey]) ? $features[$featureKey]->feature?->name : '',
                ];
                foreach($features as  $item){
                    $featureParent['options'][] = [
                        'id'   => $item->id,
                        'name' => $item->name,
                        'icon' => $item->getIcon(),
                    ];
                }
                $container[] = $featureParent;
            }
        }
        return $container;
    }

    public function modelFilter()
    {
        return $this->provideFilter(CarFilter::class);
    }

    public function getBranchObject()
    {
        if($this->branch){
            return  new BranchResource($this->branch);
        }
      return null;
    }

    public function getCityObject()
    {
        if($this->city){
            return  new CityResource($this->city);
        }
      return null;
    }

    public function getBrandObject()
    {
        if($this->brand){
            return  new BrandResource($this->brand);
        }
        return '';
    }

    public function getColorObject()
    {

        if($this->colorRelation){
            return new ColorResource($this->colorRelation);
        }
        return '';
    }

    public function getBrandModelObject()
    {
        if($this->brandModel){
            return  new BrandModelResource($this->brandModel);
        }
      return '';
    }

    public function getBrandModelExtensionObject()
    {
        if($this->brandModelExtension){
            return  new BrandModelExtensionResource($this->brandModelExtension);
        }
      return '';
    }

    public function getDriveType()
    {
        foreach(getDriveTypes() as  $driveType){
            $driveType = json_decode(json_encode($driveType),true);
            if( $driveType['key'] == $this->drive_type){
                return $driveType;
            }
        }
    }

    public function carType()
    {
        return $this->belongsTo(CarType::class);
    }

    public function getBodyType()
    {
        if($this->carType){
            return  new CarTypeResource($this->carType);
        }
        return null;
    }

    public function getFuelType()
    {
        foreach(getFuelTypes() as  $fuelType){
            $fuelType = json_decode(json_encode($fuelType),true);
            if( $fuelType['key'] == $this->fuel_type){
                return $fuelType;
            }
        }
    }

    public function getCarStatus()
    {
        foreach(getCarStatus() as  $status){
            $status = json_decode(json_encode($status),true);
            if( $status['key'] == $this->status){
                return $status;
            }
        }
    }

    public function getDescription()
    {
        return  $this->description  ??  '';
    }

    public static function count()
    {
        return Cache::remember('count_cars', 60, function () {
            return static::query()->count();
        });
    }

    public function getReportsWithOptions()
    {
        $container = [];
        if(count($this->reportOptions)){
            foreach($this->reportOptions->groupBy('report_id') as $reportKey => $reports){
                $reportKey = count($reports) -1 ;
                $reportParent = [];
                $reportParent = [
                    'id'   => isset( $reports[$reportKey]) ? $reports[$reportKey]->report_id : '',
                    'name' => isset( $reports[$reportKey]) ? $reports[$reportKey]->report_name : '',
                ];

                foreach($reports as  $item){
                    $reportParent['options'][] = [
                        'id'    => $item->id,
                        'name'  => $item->name,
                        'icon'  => $item->getIcon(),
                        'image' => $item->pivot->image,
                    ];
                }
                $container[] = $reportParent;
            }
        }
        return $container;
    }

    public function getImageReport( $reportId)
    {
        if(count($this->reportOptions)){
            foreach($this->reportOptions as $report){
                if($report->id == $reportId){
                    return $report->pivot->image;
                }
            }
        }
        return '';
    }

    public function request(){
        return $this->belongsTo(Request::class);
    }

    public function getCreatedAt(): string
    {
        return $this->created_at->format('Y-m-d');
    }

    public function getCreatedAtFormat(): string
    {
        return $this->created_at->format('D , M d ,Y');
    }

    public function getPrice()
    {
        return number_format($this->price);
    }

    public function scopeApproved($query)
    {
        return $query->where('is_approved', 1);
    }

    public function scopeHidden($query , $type)
    {
        return $query->where('is_hide', $type);
    }

    public function scopeStatus($query, $type)
    {
        return $query->where('status', $type);
    }

    public function scopeAdmin($query)
    {
        return $query->where('model_name', Admin::class);
    }

    public function scopeNotAdmin($query){
        return $query->where('model_name', '!=' ,Admin::class);
    }

    public function getDateHuman(){
        return $this->created_at->diffForHumans();
    }

    public function favorites(): BelongsToMany
    {
        return $this->belongsToMany(Car::class, 'favorites',  'car_id' , 'user_id')->withTimestamps();
    }

    public function reviews() : hasMany
    {
        return $this->hasMany(Review::class , 'car_id');
    }

    public function payments()
    {
        return $this->morphMany(Payment::class, 'ad');
    }

}
