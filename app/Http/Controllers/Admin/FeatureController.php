<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Feature\StoreFeatureRequest;
use App\Http\Requests\Admin\Feature\UpdateFeatureRequest;
use App\Models\Feature;
use App\Services\FeatureService;
use App\ViewModels\FeatureViewModel;
use Illuminate\Http\Request;

class FeatureController extends Controller
{
    public $featureService;
    
    public function __construct()
    {
        $this->featureService = new FeatureService();
        $this->middleware('permission:features.read', ['only' => ['index']]);
        $this->middleware('permission:features.create', ['only' => ['create', 'store']]);
        $this->middleware('permission:features.edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:features.delete', ['only' => ['destroy']]);
    }
    
    public function index(Request $request)
    {
        $features = $this->featureService->getData($request->all());
        return view('admin.pages.features.index' , get_defined_vars());
    }

    public function create()
    {
        return view('admin.pages.features.form' , new FeatureViewModel());
    }

    public function store(StoreFeatureRequest $storeFeatureRequest)
    {
        $this->featureService->store($storeFeatureRequest->validated());
        Session()->flash('success' , __('feature added successfully'));
        return redirect()->back();
    }

    public function edit(Feature $feature)
    {
        return view('admin.pages.features.form' , new FeatureViewModel($feature));
    }
    
    public function update(UpdateFeatureRequest $updateFeatureRequest , Feature $feature)
    {
        $this->featureService->update($feature, $updateFeatureRequest->validated());
        Session()->flash('success' , __('feature updated successfully'));
        return redirect()->back();
    }
    
    public function destroy(Feature $feature)
    {
        $this->featureService->delete($feature);
        Session()->flash('success' , __('feature Deleted successfully'));
        return redirect()->back();
    }
    
}
