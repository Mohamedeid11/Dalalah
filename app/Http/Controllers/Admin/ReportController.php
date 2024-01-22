<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Report\StoreReportRequest;
use App\Http\Requests\Admin\Report\UpdateReportRequest;
use App\Models\Report;
use App\Services\ReportService;
use App\ViewModels\ReportViewModel;
use Illuminate\Http\Request;


class ReportController extends Controller
{
    public $reportService;
    
    public function __construct()
    {
        $this->reportService = new ReportService();
        $this->middleware('permission:reports.read', ['only' => ['index']]);
        $this->middleware('permission:reports.create', ['only' => ['create', 'store']]);
        $this->middleware('permission:reports.edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:reports.delete', ['only' => ['destroy']]);
    }
    
    public function index(Request $request)
    {
        $reports = $this->reportService->getData($request->all());
        return view('admin.pages.reports.index' , get_defined_vars());
    }

    public function create()
    {
        return view('admin.pages.reports.form' , new ReportViewModel());
    }

    public function store(StoreReportRequest $storeFeatureRequest)
    {
        $this->reportService->store($storeFeatureRequest->validated());
        Session()->flash('success' , __('report added successfully'));
        return redirect()->back();
    }

    public function edit(Report $report)
    {
        return view('admin.pages.reports.form' , new ReportViewModel($report));
    }
    
    public function update(UpdateReportRequest $updateReportRequest ,Report $report)
    {
        $this->reportService->update($report, $updateReportRequest->validated());
        Session()->flash('success' , __('report updated successfully'));
        return redirect()->back();
    }
    
    public function destroy(Report $report)
    {
        $this->reportService->delete($report);
        Session()->flash('success' , __('report Deleted successfully'));
        return redirect()->back();
    }
    
}
