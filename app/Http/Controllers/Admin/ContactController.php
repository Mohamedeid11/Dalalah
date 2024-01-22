<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\JobCategory\JobCategoryStoreRequest;
use App\Http\Requests\Admin\JobCategory\JobCategoryUpdateRequest;
use App\Http\Requests\Admin\Slider\SliderStoreRequest;
use App\Http\Requests\Admin\Slider\SliderUpdateRequest;
use App\Models\Contact;
use App\Models\JobCategory;
use App\Models\Slider;
use App\Services\ContactService;
use App\Services\JobCategoryService;
use App\Services\SliderService;
use App\ViewModels\JobCategoryViewModel;
use App\ViewModels\SliderViewModel;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

class ContactController extends Controller
{  
    private $contactService;

    public function __construct()
    {
        $this->contactService = new ContactService();    
        $this->middleware('permission:contact.read', ['only' => ['index']]);
        $this->middleware('permission:contact.show', ['only' => ['show']]);
    }
    
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request) : View
    {
        $contacts = $this->contactService->getData($request->all());
        return view('admin.pages.contacts.index' , get_defined_vars());
    }

    /**
     * Show the form for creating a new resource.
     */
    public function show(Contact $contact) : View
    {
        return view('admin.pages.contacts.show' , get_defined_vars());
    }
    
}
