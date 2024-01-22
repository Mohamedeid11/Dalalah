<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Page\UpdatePageRequest;
use App\Models\Page;
use App\Services\PageService;
use Illuminate\Http\Request;


class PageController extends Controller
{
    public $pageService;
    
    public function __construct()
    {
        $this->pageService = new PageService();
        $this->middleware('permission:pages.read', ['only' => ['index']]);
        $this->middleware('permission:pages.create', ['only' => ['create', 'store']]);
        $this->middleware('permission:pages.edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:pages.delete', ['only' => ['destroy']]);
    }
    
    public function index(Request $request ,$page)
    {
        $page = $this->pageService->getPageWithSlug($page , $request->all());
        return view('admin.pages.pages.form' , get_defined_vars());
    } 
    
    public function update(UpdatePageRequest $updatePageRequest ,?Page $page)
    {
        $this->pageService->update($page, $updatePageRequest->validated());
        Session()->flash('success' , __('page updated successfully'));
        return redirect()->back();
    }
}
