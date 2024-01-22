<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Car\AddFeaturedRequest;
use App\Http\Requests\Api\CarPlate\StoreCarPlateRequest;
use App\Http\Requests\Api\CarPlate\UpdateCarPlateRequest;
use App\Http\Requests\Api\QueryRequest;
use App\Http\Resources\CarPlateResource;
use App\Http\Resources\PaginationCollection;
use App\Models\Car;
use App\Services\CarPlateService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Models\CarPlate;
use Illuminate\Support\Facades\Validator;

class CarPlateController extends Controller
{

    private $carPlateService;

    public function __construct()
    {
        $this->carPlateService = new CarPlateService();
    }
    /**
     * Display a listing of the resource.
     */
    public function index(QueryRequest $request)
    {
        $carPlates = $this->carPlateService->getMobileData($request->all() , $request->limit ?? '15' , $request->order ?? 'desc');
        return $this->returnAllDataJSON(CarPlateResource::collection($carPlates) , new PaginationCollection($carPlates));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreCarPlateRequest $request )
    {
        $data = $request->safe()->all();

        $data['letter_en'] = Str::lower($data['letter_en']);
        $data['letter_en'] = preg_replace('/\s/u' ,' ', $data['letter_en']);
        $data['letter_ar'] = preg_replace('/\s/u', ' ', $data['letter_ar']);

        $plate = $this->carPlateService->store($data);
        return $this->returnJSON($plate->id, true, '200', 'تم إضافة لوحة السيارة  بنجاح');

    }


    /**
     * Display the specified resource.
     */
    public function showUserPlates(QueryRequest $request)
    {
        $carPlates = $this->carPlateService->getUserMobileData($request->all() , $request->limit ?? '15' , $request->order ?? 'desc');
        return $this->returnAllDataJSON(CarPlateResource::collection($carPlates) , new PaginationCollection($carPlates));
    }

    /**
     * Display the specified resource.
     */
    public function show(CarPlate $carPlate)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(CarPlate $carPlate)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateCarPlateRequest $request)
    {
        $user = auth('end-user-api')->user() ?? auth('showroom-api')->user();
        $CarPlate =  $user->carPlates->find($request->id);

        $data = $request->safe()->all();
        unset($data['id']);

        if (!$CarPlate){
            return $this->returnWrong('غير مصرح لك بتعديل هذه اللوحه', JsonResponse::HTTP_UNAUTHORIZED);
        }

        $carPlate = $this->carPlateService->update($CarPlate , $data);
        if ($carPlate){

            return $this->returnJSON($carPlate->id, true, '200', __('site.car_plate') . ' ' .__('site.success_update'));
        }else{
            return $this->returnWrong('غير مصرح لك بتعديل هذه اللوحه', JsonResponse::HTTP_UNAUTHORIZED);
        }
    }

    public function hideOrUnHide($id)
    {
        $user = auth('end-user-api')->user() ?? auth('showroom-api')->user();
        $plate =  $user->carPlates->find($id);
        if ($plate){

            $plate->update(['is_hide' => !$plate->is_hide]);
        }else{
            return $this->returnWrong('غير مصرح لك بتعديل هذه اللوحه', JsonResponse::HTTP_UNAUTHORIZED);
        }
        return $this->returnJSON(new CarPlateResource($plate), true, '200', __('site.status_changed_successfully'));
    }

    public function soldStatus(CarPlate $carPlate)
    {
        if ($carPlate->bought_status == 'sold' ){
            $carPlate->update(['bought_status' => 'not_sold']);
        }else{
            $carPlate->update(['bought_status' => 'sold']);
        }

        return $this->returnSuccess(__('site.status_changed_successfully'));
    }

    public function showroomPlates(Request $request)
    {

        $request->validate(['showroom_id'=>'required|exists:showrooms,id'] );

        $carPlates = $this->carPlateService->getShowroomPlates($request->showroom_id);

        return $this->returnAllDataJSON(CarPlateResource::collection($carPlates) , new PaginationCollection($carPlates));
    }


    public function featuredPlate(AddFeaturedRequest $request)
    {
        $user = auth('end-user-api')->user() ?? auth('showroom-api')->user();

        $validator = Validator::make($request->all(), ['id' => 'exists:car_plates,id',],
            ['id.exists' => __('mobileValidation.car_plate_id_exists'),]);

        if ($validator->fails()) {
            return $this->returnWrong(__('mobileValidation.car_plate_id_exists'), JsonResponse::HTTP_UNAUTHORIZED);

        }

        $CarPlate =  $user->carPlates->find($request->id);
        if (!$CarPlate){
            return $this->returnWrong('غير مصرح لك بتعديل هذه اللوحه', JsonResponse::HTTP_UNAUTHORIZED);
        }

        $CarPlate = $this->carPlateService->update($CarPlate, ['ad_type' =>$request->ad_type]);

        if ($CarPlate){

            return $this->returnJSON(new CarPlateResource($CarPlate), true, '200', __('site.car_plate') . ' ' .__('site.success_update'));
        }else{
            return $this->returnWrong(__('error'));
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(CarPlate $carPlate)
    {
        $carPlate->delete();
        return $this->returnSuccess(__('site.car_plate_deleted_successfully'));
    }
}
