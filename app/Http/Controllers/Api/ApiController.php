<?php

namespace App\Http\Controllers\Api;

use App\Traits\ApiHelperTrait;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;


class ApiController extends BaseController
{
    use AuthorizesRequests, ValidatesRequests ,ApiHelperTrait;   
}
