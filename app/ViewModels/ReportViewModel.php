<?php

namespace App\ViewModels;

use App\Models\Feature;
use App\Models\Report;
use Spatie\ViewModels\ViewModel;

class ReportViewModel extends ViewModel
{
        
    public function __construct(public ?Report $report = null)
    {
        $this->report = is_null($report) ? new Report(old()) : $report;
    }

    public function action(): string
    {
        return is_null($this->report->id)
            ? route('admin.report.store')
            : route('admin.report.update', ['report' => $this->report->id]);
    }

    public function method(): string
    {
        return is_null($this->report->id) ? 'POST' : 'PUT';
    }
    
}
