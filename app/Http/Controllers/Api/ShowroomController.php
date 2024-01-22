<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\QueryRequest;
use App\Http\Resources\BranchResource;
use App\Http\Resources\CarResource;
use App\Http\Resources\PaginationCollection;
use App\Http\Resources\ShowroomResource;
use App\Models\Car;
use App\Models\Showroom;
use App\Services\ShowRoomService;
use Illuminate\Http\Request;
use Spatie\Permission\Commands\Show;

class ShowroomController extends Controller
{
    private $showRoomService;

    public function __construct()
    {
        $this->showRoomService = new ShowRoomService();
    }

    public function getAllAgencies(QueryRequest $request)
    {
        $Agencies = $this->showRoomService
            ->getAgencyData($request->all() , $request->limit ?? 15 , $request->order ?? 'desc');
            return $this->returnAllDataJSON(ShowroomResource::collection($Agencies) ,
            new PaginationCollection($Agencies));
    }

    public function getAllShowrooms(QueryRequest $request)
    {
        $showrooms = $this->showRoomService
            ->getShowroomData($request->all() , $request->limit ?? 15 , $request->order ?? 'desc');
            return $this->returnAllDataJSON(ShowroomResource::collection($showrooms) ,
            new PaginationCollection($showrooms));
    }

    public function getBranches(QueryRequest $request , Showroom $showroom)
    {
        $branches = $this->showRoomService
            ->getWithoutPaginateBranches( $showroom);
            return $this->returnJSON(BranchResource::collection($branches));
    }

    public function getShowroom($id)
    {
        $showroom = $this->showRoomService->getShowroom( $id);
        return $this->returnJSON(new ShowroomResource($showroom));
    }

    public function getShowroomCars($id ,Request $request)
    {
        $showroom = $this->showRoomService->getShowroom( $id);

        $showroomCars = $showroom->cars()->with('media')->where('status' , $request->status)->orderBy('id' , 'DESC')->paginate(15);

        return $this->returnAllDataJSON(CarResource::collection($showroomCars), new PaginationCollection($showroomCars));
    }

}
