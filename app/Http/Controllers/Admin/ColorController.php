<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Color\ColorStoreRequest;
use App\Http\Requests\Admin\Color\ColorUpdateRequest;
use App\Models\Color;
use App\Services\ColorService;
use App\ViewModels\ColorViewModel;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;


class ColorController extends Controller
{
    
    private $colorService;

    public function __construct()
    {
        $this->colorService = new ColorService();    
        $this->middleware('permission:colors.read', ['only' => ['index']]);
        $this->middleware('permission:colors.create', ['only' => ['create', 'store']]);
        $this->middleware('permission:colors.edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:colors.delete', ['only' => ['destroy']]);  
    }
    
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request) : View
    {
        $colors = $this->colorService->getData($request->all());
        return view('admin.pages.colors.index' , get_defined_vars());
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create() : View
    {
        return view('admin.pages.colors.form' , new ColorViewModel());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(ColorStoreRequest $request) : RedirectResponse
    {
        $this->colorService->store($request->validated());
        session()->flash('success', __('color added successfully'));
        return back();
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Color $color) : View
    {
        return view('admin.pages.colors.form' , new ColorViewModel($color));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(ColorUpdateRequest $request, Color $color) : RedirectResponse
    {
        $this->colorService->update($color , $request->validated());
        session()->flash('success',  __('color updated successfully'));
        return back();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Color $color) : RedirectResponse
    {
        $this->colorService->delete($color);
        session()->flash('success',  __('color deleted successfully'));
        return back();
    }
    
}
