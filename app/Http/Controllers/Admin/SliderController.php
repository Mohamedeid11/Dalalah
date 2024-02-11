<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\JobCategory\JobCategoryStoreRequest;
use App\Http\Requests\Admin\JobCategory\JobCategoryUpdateRequest;
use App\Http\Requests\Admin\Slider\SliderStoreRequest;
use App\Http\Requests\Admin\Slider\SliderUpdateRequest;
use App\Models\JobCategory;
use App\Models\Slider;
use App\Services\JobCategoryService;
use App\Services\SliderService;
use App\ViewModels\JobCategoryViewModel;
use App\ViewModels\SliderViewModel;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

class SliderController extends Controller
{

    private $sliderService;

    public function __construct()
    {
        $this->sliderService = new SliderService();
        $this->middleware('permission:sliders.read', ['only' => ['index']]);
        $this->middleware('permission:sliders.create', ['only' => ['create', 'store']]);
        $this->middleware('permission:sliders.edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:sliders.delete', ['only' => ['destroy']]);
    }

    /**
     * Display a listing of the resource.
     */
    public function index(Request $request) : View
    {
        $sliders = $this->sliderService->getData($request->all());
        return view('admin.pages.sliders.index' , get_defined_vars());
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create() : View
    {
        return view('admin.pages.sliders.form' , new SliderViewModel());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(SliderStoreRequest $request) : RedirectResponse
    {
        $this->sliderService->store($request->all());
        session()->flash('success', __('تم اضافة سلايدر'));
        return back();
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Slider $slider) : View
    {
        return view('admin.pages.sliders.form' , new SliderViewModel($slider));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(SliderUpdateRequest $request, Slider $slider) : RedirectResponse
    {
        $this->sliderService->update($slider , $request->all());
        session()->flash('success', __('تم تعديل سلايدر'));
        return back();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Slider $slider) : RedirectResponse
    {
        $this->sliderService->delete($slider);
        session()->flash('success', __('تم مسح القسم'));
        return back();
    }

}
