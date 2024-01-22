<?php

namespace App\Http\Controllers\EndUser;

use App\Http\Controllers\Controller;
use App\Models\Page;
use Illuminate\Http\Request;

class PageController extends Controller
{
    
    /**
     * Show the form for creating a new resource.
     */
    public function show(Request $request)
    {
        $page = Page::where('slug' , $request->slug)->first();
        return view('end-user.pages.page' , get_defined_vars());
    }
    
}
