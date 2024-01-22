<?php

namespace App\ViewModels;

use App\Models\Branch;
use App\Models\City;
use App\Models\Showroom;
use Spatie\ViewModels\ViewModel;


class BranchViewModel extends ViewModel
{
    public $cities; 

    public function __construct(public ?Showroom $showroom, public ?Branch $branch = null)
    {
        $this->branch  = is_null($branch) ? new Branch(old()) : $branch;
        $this->cities = City::get();
    }

    public function action(): string
    {
        return is_null($this->branch ->id)
            ? route('admin.branch.store',  ['showroom' => $this->showroom->id])
            : route('admin.branch.update', ['showroom' => $this->showroom->id, 'branch' => $this->branch->id]);
    }

    public function method(): string
    {
        return is_null($this->branch->id) ? 'POST' : 'PUT';
    }   
    
}
