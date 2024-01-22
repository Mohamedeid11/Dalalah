<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Branch\StoreBranchRequest;
use App\Http\Requests\Admin\Branch\UpdateBranchRequest;
use App\Http\Requests\Admin\Brand\StoreBrandRequest;
use App\Http\Requests\Admin\Brand\UpdateBrandRequest;
use App\Models\Branch;
use App\Models\Brand;
use App\Models\District;
use App\Models\Showroom;
use App\Services\BranchService;
use App\Services\BrandService;
use App\ViewModels\BranchViewModel;
use App\ViewModels\BrandViewModel;
use Illuminate\Http\Request;

class BranchController extends Controller
{
    public $branchService;
    
    public function __construct()
    {
        $this->branchService = new BranchService();
        $this->middleware('permission:branches.read', ['only' => ['index']]);
        $this->middleware('permission:branches.create', ['only' => ['create', 'store']]);
        $this->middleware('permission:branches.edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:branches.delete', ['only' => ['destroy']]);
    }
    
    public function index(Request $request , ?Showroom $showroom)
    {
        $branches = $this->branchService->getData($request->all() , 15 ,$showroom);
        return view('admin.pages.branches.index' , get_defined_vars());
    } 

    public function create(?Showroom $showroom)
    {
        return view('admin.pages.branches.form' , new BranchViewModel($showroom));
    }

    public function store(StoreBranchRequest $storeBranchRequest)
    {
        $this->branchService->store($storeBranchRequest->validated());
        Session()->flash('success' , __('branch added successfully'));
        return redirect()->back();
    }

    public function edit(?Showroom $showroom , Branch $branch)
    {
        return view('admin.pages.branches.form' , new BranchViewModel($showroom , $branch));
    }
    
    public function update(UpdateBranchRequest $updateBranchRequest , Showroom $showroom ,Branch $branch)
    {
        $this->branchService->update($branch, $updateBranchRequest->validated());
        Session()->flash('success' , __('branch updated successfully'));
        return redirect()->back();
    }
    
    public function destroy(?Showroom $showroom , Branch $branch)
    {
        $this->branchService->delete($branch);
        Session()->flash('success' , __('branch Deleted successfully'));
        return redirect()->back();
    }

    public function getDistricts(Request $request)
    {
        $cities = District::where('city_id' , $request->value)->get(); 
        if($cities){
            return response()->json(['data' => $cities]);
        }
    }
    
}
