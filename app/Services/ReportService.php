<?php 

namespace App\Services;

use App\Models\Feature;
use App\Models\Report;

class ReportService {

    public function getData(array $data ,int $paginate = 15)
    {
        return  Report::orderBy('id','desc')->paginate($paginate);
    }

    public function store(array $data)
    {
      return Report::create($data);
    }

    public function update($report , $data)
    {
        $report->update($data);
        return $report;
    }

    public function delete($report)
    {
        return $report->delete();
    }

}