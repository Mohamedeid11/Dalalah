<?php

namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;

use App\Http\Requests\Admin\FeatureOption\StoreFeatureOptionRequest;
use App\Http\Requests\Admin\FeatureOption\UpdateFeatureOptionRequest;
use App\Models\Feature;
use App\Models\FeatureOption;
use App\Services\FeatureOptionService;
use App\ViewModels\FeatureOptionViewModel;
use Illuminate\Http\Request;


class FeatureOptionController extends Controller
{
    public $featureOptionService;
    
    public function __construct()
    {
        $this->featureOptionService = new FeatureOptionService();
        $this->middleware('permission:feature_options.read', ['only' => ['index']]);
        $this->middleware('permission:feature_options.create', ['only' => ['create', 'store']]);
        $this->middleware('permission:feature_options.edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:feature_options.delete', ['only' => ['destroy']]);
    }
    
    public function index(Request $request , ?Feature $feature)
    {
        $featureOptions = $this->featureOptionService->getData($request->all() , 15 ,$feature);
        return view('admin.pages.feature_options.index' , get_defined_vars());
    } 

    public function create(?Feature $feature)
    {
        return view('admin.pages.feature_options.form' , new FeatureOptionViewModel($feature));
    }

    public function store(StoreFeatureOptionRequest $storeFeatureOptionRequest)
    {
        $this->featureOptionService->store($storeFeatureOptionRequest->all());
        Session()->flash('success' , __('Feature Option added successfully'));
        return redirect()->back();
    }

    public function edit(?Feature $feature , FeatureOption $featureOption)
    {
        return view('admin.pages.feature_options.form' ,
                new FeatureOptionViewModel($feature , $featureOption));
    }
    
    public function update(UpdateFeatureOptionRequest $updateFeatureOptionRequest , ?Feature $feature , FeatureOption $featureOption)
    {
        $this->featureOptionService->update($featureOption, $updateFeatureOptionRequest->all());
        Session()->flash('success' , __('Feature Option updated successfully'));
        return redirect()->back();
    }
    
    public function destroy(?Feature $feature , FeatureOption $featureOption)
    {
        $this->featureOptionService->delete($featureOption);
        Session()->flash('success' , __('Feature Option Deleted successfully'));
        return redirect()->back();
    }
    
}
