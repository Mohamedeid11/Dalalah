<?php

namespace App\Http\Controllers\EndUser;

use App\Http\Controllers\Controller;
use App\Http\Requests\EndUser\StoreContactRequest;
use App\Models\Contact;
use Illuminate\Http\Request;


class ContactController extends Controller
{
    
    /**
     * Show the form for creating a new resource.
     */
    public function index()
    {
        return view('end-user.contact');
    }

    public function store(StoreContactRequest $storeContactRequest)
    {
        Contact::create($storeContactRequest->validated());
        return response()->json(true);
    }
    
}
