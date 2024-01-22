<?php

namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;

use App\Http\Requests\Admin\ReportOption\StoreReportOptionRequest;
use App\Http\Requests\Admin\ReportOption\UpdateReportOptionRequest;
use App\Models\Report;
use App\Models\ReportOption;
use App\Services\ReportOptionService;
use App\ViewModels\ReportOptionViewModel;
use Illuminate\Http\Request;


class ReportOptionController extends Controller
{
    public $reportOptionService;
    
    public function __construct()
    {
        $this->reportOptionService = new ReportOptionService();
        $this->middleware('permission:report_options.read', ['only' => ['index']]);
        $this->middleware('permission:report_options.create', ['only' => ['create', 'store']]);
        $this->middleware('permission:report_options.edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:report_options.delete', ['only' => ['destroy']]);
    }
    
    public function index(Request $request , ?Report $report)
    {
        $reportOptions = $this->reportOptionService->getData($request->all() , 15 ,$report);
        return view('admin.pages.report_options.index' , get_defined_vars());
    } 

    public function create(?Report $report)
    {
        return view('admin.pages.report_options.form' , new ReportOptionViewModel($report));
    }

    public function store(StoreReportOptionRequest $storeReportOptionRequest)
    {
        $this->reportOptionService->store($storeReportOptionRequest->all());
        Session()->flash('success' , __('Report Option added successfully'));
        return redirect()->back();
    }

    public function edit(?Report $report , ReportOption $reportOption)
    {
        return view('admin.pages.report_options.form' ,
                new ReportOptionViewModel($report , $reportOption));
    }
    
    public function update(UpdateReportOptionRequest $updateReportOptionRequest ,?Report $report , ReportOption $reportOption)
    {
        $this->reportOptionService->update($reportOption, $updateReportOptionRequest->all());
        Session()->flash('success' , __('Report Option updated successfully'));
        return redirect()->back();
    }
    
    public function destroy(?Report $report , ReportOption $reportOption)
    {
        $this->reportOptionService->delete($reportOption);
        Session()->flash('success' , __('Report Option Deleted successfully'));
        return redirect()->back();
    }
}
