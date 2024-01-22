<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Contact\StoreContactRequest;
use App\Http\Resources\ContactFormResource;
use App\Services\ContactService;


class ContactController extends Controller
{
    private $contactService;

    public function __construct()
    {
        $this->contactService = new ContactService();

    }

    /**
     * Display a listing of the resource.
     */
    public function store(StoreContactRequest $request)
    {
        $user = auth('end-user-api')->user();
        $data = [
            'name' => $user->name,
            'email' => $user->email,
            'phone' => $user->phone,
            'subject' => $request['subject'],
            'content' => $request['content'],
        ];

        $contact = $this->contactService->sotreMobileData($data);
        return $this->returnJSON( new ContactFormResource($contact), true, '200',  __('site.request_sent_Successfully'));
    }


}
