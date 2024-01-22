<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Showroom\StoreShowroomRequest;
use App\Http\Requests\Admin\Showroom\UpdateShowroomRequest;
use App\Models\Showroom;
use App\Services\ShowRoomService;
use App\ViewModels\ShowRoomViewModel;
use Illuminate\Http\Request;

class ShowRoomController extends Controller
{
    public $showRoomService;

    public function __construct()
    {
        $this->showRoomService = new ShowRoomService();
        $this->middleware('permission:showrooms.read', ['only' => ['index']]);
        $this->middleware('permission:showrooms.create', ['only' => ['create', 'store']]);
        $this->middleware('permission:showrooms.edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:showrooms.delete', ['only' => ['destroy']]);
    }

    public function index(Request $request)
    {
        $showrooms = $this->showRoomService->getData($request->all());
        return view('admin.pages.showrooms.index' , get_defined_vars());
    }

    public function create()
    {
        return view('admin.pages.showrooms.form' , new ShowRoomViewModel());
    }

    public function store(StoreShowroomRequest $storeShowroomRequest)
    {
        $this->showRoomService->store($storeShowroomRequest->validated());
        Session()->flash('success' , __('showroom added successfully'));
        return redirect()->back();
    }

    public function edit(Showroom $showroom)
    {
        return view('admin.pages.showrooms.form' , new ShowRoomViewModel($showroom));
    }

    public function update(UpdateShowroomRequest $updateShowroomRequest , Showroom $showroom)
    {
        $this->showRoomService->update($showroom, $updateShowroomRequest->validated());
        Session()->flash('success' , __('showroom updated successfully'));
        return redirect()->back();
    }

    public function destroy(Showroom $showroom)
    {
        $this->showRoomService->delete($showroom);
        Session()->flash('success' , __('showroom Deleted successfully'));
        return redirect()->back();
    }

    public function blocked(Showroom $showroom)
    {
       $this->showRoomService->update($showroom ,['is_blocked'=> !$showroom->is_blocked ]);

        if($showroom->is_blocked){
            $showroom->cars()->where('model_name', Showroom::class)->each(function ($item){
                $item->update(['is_hide'=>1]);
            });
        }else{
            $showroom->cars()->where('model_name', Showroom::class)->each(function ($item){
                $item->update(['is_hide'=>0]);
            });
        }
       session()->flash('success', __('Blocked status changed successfully'));
       return response()->json();
    }

    public function hidden(Showroom $showroom)
    {
       $this->showRoomService->update($showroom ,['is_hide'=> !$showroom->is_hide]);

       session()->flash('success', __('Hidden status changed successfully'));
       return response()->json();
    }

    public function approved(Showroom $showroom){
       $this->showRoomService->update($showroom ,['is_approved'=> !$showroom->is_approved ]);
       session()->flash('success', __('Approved status changed successfully'));
       return response()->json();
    }

    public function getCars(Showroom $showroom){
        $cars = $showroom->cars()->with(['brand'])->where('model_name',Showroom::class)->paginate();
        return view('admin.pages.showrooms.list_cars' , get_defined_vars());
    }

}
