<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Branch\StoreBranchRequest;
use App\Http\Requests\Api\Branch\UpdateBranchRequest;
use App\Http\Resources\BranchResource;
use App\Models\Branch;
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
    }

    public function index()
    {
        $branches = $this->branchService->getWithoutPaginateBranches( auth('showroom-api')->user());
        return $this->returnJSON(BranchResource::collection($branches));
    }

    public function show($id)
    {
        $showroom = Showroom::findOrFail($id);
        $branches = $this->branchService->getWithoutPaginateBranches($showroom);
        return $this->returnJSON(  BranchResource::collection($branches));
    }

    public function store(StoreBranchRequest $storeBranchRequest)
    {
        $branch = $this->branchService->apiStore($storeBranchRequest->validated());
        return $this->returnJSON(new BranchResource($branch), true, 200, 'تم إضافة الفرع بنجاح');
    }

    public function update(UpdateBranchRequest $updateBranchRequest , $id)
    {
        $branch = Branch::findOrFail($id);
        $branch = $this->branchService->update($branch ,$updateBranchRequest->validated());
        return $this->returnJSON(new BranchResource($branch));
    }

    public function hideBranch(Branch $branch)
    {
        $this->branchService->update($branch ,['is_hide'=> !$branch->is_hide ]);
        return $this->returnSuccess(__('mobileValidation.branch_updated_successfully'));
    }

}
