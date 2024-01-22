<?php

namespace App\ViewModels;

use App\Models\Branch;
use App\Models\City;
use App\Models\Feature;
use App\Models\FeatureOption;
use App\Models\Report;
use App\Models\ReportOption;
use App\Models\Showroom;
use Spatie\ViewModels\ViewModel;


class ReportOptionViewModel extends ViewModel
{

    public function __construct(public ?Report $report, public ?ReportOption $reportOption = null)
    {
        $this->reportOption  = is_null($reportOption) ? new ReportOption(old()) : $reportOption;
    }

    public function action(): string
    {
        return is_null($this->reportOption ->id)
            ? route('admin.report_option.store',  ['report' => $this->report->id])
            : route('admin.report_option.update', ['report' => $this->report->id, 'report_option' => $this->reportOption->id]);
    }

    public function method(): string
    {
        return is_null($this->reportOption->id) ? 'POST' : 'PUT';
    }   
    
}
