<?php 

namespace App\Services;

use App\Models\ReportOption;
use Illuminate\Support\Arr;

class ReportOptionService {

    public function getData(array $data ,int $paginate = 15, $report)
    {
        return  ReportOption::orderBy('id','desc')
                        ->where('report_id' , $report->id)->paginate($paginate);
    }

    public function store(array $data)
    {
        $reportOption  =  ReportOption::create(Arr::except($data , 'icon'));
        if(isset($data['icon'])){
            $reportOption->storeFile($data['icon'] , '-icon');
        }
        return $reportOption;
    }

    public function update($reportOption , $data)
    {
        $reportOption->update(Arr::except($data , 'icon'));
        if(isset($data['icon'])){
            $reportOption->updateFile($data['icon'] , '-icon');
        }
        return $reportOption;
    }

    public function delete($reportOption)
    {
        return  $reportOption->delete();
    }

}