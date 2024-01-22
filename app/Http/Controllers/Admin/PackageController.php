<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Package\StorePackageRequest;
use App\Http\Requests\Admin\Package\UpdatePackageRequest;
use App\Models\Package;
use App\Services\PackageService;
use App\ViewModels\PackageViewModel;
use Illuminate\Http\Request;


class PackageController extends Controller
{
    public $packageService;
    
    public function __construct()
    {
        $this->packageService = new PackageService();
        $this->middleware('permission:packages.read', ['only' => ['index']]);
        $this->middleware('permission:packages.create', ['only' => ['create', 'store']]);
        $this->middleware('permission:packages.edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:packages.delete', ['only' => ['destroy']]);
    }
    
    public function index(Request $request)
    {
        $packages = $this->packageService->getData($request->all() , 15 );
        return view('admin.pages.packages.index' , get_defined_vars());
    } 

    public function create()
    {
        return view('admin.pages.packages.form' , new PackageViewModel());
    }

    public function store(StorePackageRequest $storeBranchRequest)
    {
        $this->packageService->store($storeBranchRequest->validated());
        Session()->flash('success' , __('Package added successfully'));
        return redirect()->back();
    }

    public function edit(Package $package)
    {
        return view('admin.pages.packages.form' , new PackageViewModel($package));
    }
    
    public function update(UpdatePackageRequest $updatePackageRequest , Package $package)
    {
        $this->packageService->update($package, $updatePackageRequest->validated());
        Session()->flash('success' , __('Package updated successfully'));
        return redirect()->back();
    }
    
    public function destroy( Package $package)
    {
        if(count($package->showrooms)){
            Session()->flash('error' , __('Cannot Delete Package'));
            return redirect()->back();
        }else{
            $this->packageService->delete($package);
            Session()->flash('success' , __('Package Deleted successfully'));
            return redirect()->back();
        }
    }
    
}
