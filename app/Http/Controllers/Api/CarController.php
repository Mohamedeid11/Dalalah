<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Car\AddFeaturedRequest;
use App\Http\Requests\Api\Car\CreateNewCarRequest;
use App\Http\Requests\Api\Car\InstallmentCalculationRequest;
use App\Http\Requests\Api\Car\StoreCarRequest;
use App\Http\Requests\Api\Car\StoreNewCarRequest;
use App\Http\Requests\Api\Car\UpdateCarRequest;
use App\Http\Requests\Api\Car\UpdateImagesRequest;
use App\Http\Requests\Api\QueryRequest;
use App\Http\Resources\AdminCarResource;
use App\Http\Resources\CarResource;
use App\Http\Resources\PaginationCollection;
use App\Http\Resources\SameCarsResource;
use App\Jobs\SameCarAddedNotificationJob;
use App\Models\Admin;
use App\Models\Car;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Models\Showroom;
use App\Notifications\CarStatusSoldNotification;
use App\Services\CarService;
use Illuminate\Support\Facades\Notification;
use Illuminate\Support\Facades\Validator;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class CarController extends Controller
{
    private $carService;

    public function __construct()
    {
        $this->carService = new CarService();
    }

    public function index(QueryRequest $request)
    {
//        return $request->all();
        $cars = $this->carService->getMobileData($request->all() , $request->limit ?? '15' , $request->order ?? 'desc');
        return $this->returnAllDataJSON(CarResource::collection($cars) , new PaginationCollection($cars));
    }

    public function getAdminCars(QueryRequest $request)
    {
        $cars = $this->carService->getAdminCarsData($request->all() , $request->limit ?? '15' , $request->order ?? 'desc');
        return $this->returnAllDataJSON(AdminCarResource::collection($cars) , new PaginationCollection($cars));
    }

    public function getMyCars()
    {
        $cars = $this->carService->getMobileMyCars();
        return $this->returnAllDataJSON(CarResource::collection($cars) , new PaginationCollection($cars));
    }

    public function store(StoreCarRequest $storeCarRequest)
    {
        $car = $this->carService->store($storeCarRequest->validated());

        //       Here to send to notification for users who have same car (back side)
            SameCarAddedNotificationJob::dispatch($car);

        return $this->returnJSON( $car->id, true, '200', __('site.car').' ' .__('site.success_add') .__('site.wait_admin_approve'));
    }

    public function featuredCar(AddFeaturedRequest $request)
    {
        $validator = Validator::make($request->all(), ['id' => 'exists:cars,id',],
            ['id.exists' => __('mobileValidation.car_id_exists'),]);

        if ($validator->fails()) {
            return $this->returnWrong(__('mobileValidation.car_id_exists'), JsonResponse::HTTP_UNAUTHORIZED);
        }

        $car = Car::findOrFail($request->id);

        $car = $this->carService->update($car, $request->except('id'));

        if ($car){

            return $this->returnJSON([] , true,200, __('site.car').' ' .__('site.success_update'));
        }else{
            return $this->returnWrong(__('error'));
        }
    }

    public function show($id)
    {
        // call the job queue
//        MostViewedNotificationJob::dispatch();

        $car = Car::findOrFail($id);
        $showroom_cars = Car::where('id', '!=' , $car->id)->where('car_id' , $car->id)->get();
        $related_cars = Car::where('brand_id', $car->brand_id)->whereNull('car_id')->orderBy('id' , 'DESC')->limit(5)->get();

        return $this->returnJSON([
            'car'           => new CarResource($car),
            'same_cars'     => SameCarsResource::collection($showroom_cars),
            'related_cars'  => CarResource::collection($related_cars),
            ]);
    }

    public function update(UpdateCarRequest $updateCarRequest , $id)
    {
        $car = Car::findOrFail($id);
        $car = $this->carService->update($car,$updateCarRequest->validated());
        return $this->returnJSON( $car->id , true,200, __('site.car').' ' .__('site.success_update'));
    }

    public function hideOrUnHide(Car $car)
    {
        $car->update(['is_hide' => !$car->is_hide]);
        return $this->returnJSON(new CarResource($car) , true , 200 ,__('site.status_changed_successfully'));
    }

    public function soldStatus(Car $car)
    {
        if ($car->status_buyed == 'approved' ){
            $car->update(['status_buyed' => 'sold']);
        }else{
            $car->update(['status_buyed' => 'approved']);
        }

        return $this->returnSuccess(__('site.status_changed_successfully'));
    }

    public function updateImages(UpdateImagesRequest $request)
    {
        $car = Car::findOrFail($request->car_id);
        if (isset($request->image_id)){
            $image = Media::findOrFail( $request->image_id);
            $image->forceDelete();
            $car = $this->carService->updateMobileImages($car,['images' => $request->image]);

        }else{

            $car = $this->carService->updateMobileImages($car,['main_image' => $request->image]);
        }

        if ($car){

            return $this->returnJSON([] , true,200, __('site.car').' ' .__('site.success_update'));
        }else{
            return $this->returnWrong(__('error'));
        }
    }

    public function deleteImage($id)
    {
        $image = Media::findOrFail($id);
        $image->forceDelete();

        return $this->returnSuccess();
    }

    public function carGetBuyed(Car $car)
    {
        if($car->status_buyed != 'sold'){
            $car->update(['status_buyed' => 'sold']);
            $admins = Admin::get();
            Notification::send($admins , new CarStatusSoldNotification($car));
           return $this->returnJSON(new CarResource($car));
        }
        return $this->returnWrong(__('mobileValidation.car_has_been_sold'));
    }


    public function createNewCar(CreateNewCarRequest $request)
    {
        $car = Car::admin()->where([
            'brand_id' => $request->brand_id ,
            'car_model_id' => $request->car_model_id ,
            'car_model_extension_id' => $request->car_model_extension_id ,
            'year' => $request->year])->first();

        if (!$car){
            return $this->returnWrong(__('mobileValidation.car_id_exists'));
        }
        return $this->returnJSON(new CarResource($car));

    }

    public function storeNewCar(StoreNewCarRequest $request)
    {

        $admin_car = Car::findOrFail($request->car_id);

        $newCar = $admin_car->replicate();
        $newCar->price = $request->price;
        $newCar->car_id = $request->car_id;
        $newCar->model_name = Showroom::class;
        $newCar->model_id = auth()->guard('showroom-api')->user()->id;
        $newCar->monthly_installment = $request->monthly_installment;
        $newCar->description = $request->description;
        $newCar->is_approved = 0;
        $newCar->ad_type = 'basic';
        $newCar->status = 'new';

        $newCar->save();

        if(isset($request['images'])){
            if (!in_array($request['main_image'] , $request['images'] )){
                $newCar->storeFiles($request['images']);
            }
        }
        if(isset($request['main_image'])){
            $newCar->storeFile($request['main_image'],'-logo');
        }

        return $this->returnJSON( $newCar->id, true, '200', __('site.car').' ' .__('site.success_add') .__('site.wait_admin_approve'));
    }

    public function InstallmentCalculation(InstallmentCalculationRequest $request){
        $base_salary = $request->gross_salary * (45/100);
        $result = $base_salary - ($request->personal_finance + $request->mortgage + $request->credit_card);

//        $cars = Car::notAdmin()
//            ->status('new')
//            ->whereNotNull('monthly_installment')
//            ->where('monthly_installment' , '<=' , $result)
//            ->paginate(15);

        return $this->returnJSON($result);
    }

    public function installmentFilter(Request $request)
    {
        $cars = Car::notAdmin()
            ->status('new')
            ->whereNotNull('monthly_installment')
            ->where('monthly_installment' , '<=' , $request->installment)
            ->paginate(15);
        return $this->returnAllDataJSON(CarResource::collection($cars) , new PaginationCollection($cars));
    }
    public function delete(Car $car){
        $car->delete();
        return $this->returnSuccess(__('site.car_deleted_successfully'));
    }

}
