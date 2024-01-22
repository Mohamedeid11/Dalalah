<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Branch\StoreBranchRequest;
use App\Http\Requests\Admin\Branch\UpdateBranchRequest;
use App\Http\Requests\Admin\Brand\StoreBrandRequest;
use App\Http\Requests\Admin\Brand\UpdateBrandRequest;
use App\Models\Branch;
use App\Models\Brand;
use App\Models\District;
use App\Models\Showroom;
use App\Services\BranchService;
use App\Services\BrandService;
use App\Services\PaymentService;
use App\ViewModels\BranchViewModel;
use App\ViewModels\BrandViewModel;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    public $paymentService;

    public function __construct()
    {
        $this->paymentService = new PaymentService();
        $this->middleware('permission:payment.read', ['only' => ['index']]);
    }

    public function index()
    {
        $payments = $this->paymentService->getData();
        return view('admin.pages.Payment.index' , get_defined_vars());
    }


}
