<?php

namespace App\Livewire\EndUser;

use App\Models\Brand;
use App\Models\Car;
use App\Models\CarModel;
use App\Models\CarModelExtension;
use App\Models\FeatureOption;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Request;
use Livewire\Component;
use Livewire\WithPagination;


class FilterCar extends Component
{
    use WithPagination;

    public $brands;
    public $extensions          = [];
    public $models              = [];
    public $selectedBrands      = [];
    public $selectedModels      = [];
    public $selectedExtensions  = [];
    public $modelRole           = '';
    public $status              = '';
    public $fromPrice;
    public $toPrice;
    public $features;
    public $selectedFeatures  = [];
    public $driveType         = '';
    public $fuelType          = [];
    public $selectedYears     = [];
    public $years;

    public function mount()
    {
        $this->brands                =  Brand::get(); 
        $this->modelRole             =  request()->model_role;
        $this->features              =  FeatureOption::get();
        $this->status                =  request()->status;
        isset(request()->brand)     ?? $this->selectedBrands[] = request()->brand;
        isset(request()->car_model) ?? $this->selectedModels[] = request()->car_model;
        isset(request()->year)      ?? $this->selectedYears[]  = request()->year;
        $this->years                 =  range(Carbon::now()->year, 1990);
    }

    public function render()
    {
        if(count($this->selectedBrands)){
            $this->getModels();
        }
        if(count($this->selectedModels)){
            $this->getExtensions();
        }
        
        $cars = $this->searchQuery();
        return view('livewire.end-user.filter-car' , get_defined_vars());
    }

    public function searchQuery()
    {
        $data = [
                    'model_role'       => $this->modelRole,
                    'status'           => $this->status, 
                    'years'            => $this->selectedYears, 
                    'all_brands'       => $this->selectedBrands,
                    'all_models'       => $this->selectedModels,
                    'allExtensions'    => $this->selectedExtensions,
                    'allFeatures'      => $this->selectedFeatures,
                    'start_price'      => $this->fromPrice,
                    'end_price'        => $this->toPrice,
                    'driveType'        => $this->driveType,
                    'fuelTypes'        => $this->fuelType,
                ];
        return Car::with(['media','showroom','user'])
                    ->hidden(0)
                    ->approved()
                    ->filter($data)
                    ->paginate();
    }

    public function getModels(){
        if(count($this->selectedBrands)){
            $this->models = CarModel::whereIn('brand_id', $this->selectedBrands)->get(); 
        }else{
            $this->models = [];
            $this->extensions = [];
        }
    }

    public function getExtensions(){
        if(count($this->selectedModels)){
            $this->extensions = CarModelExtension::whereIn('car_model_id', $this->selectedModels)->get();    
        }else{
            $this->extensions = [];
        }
    }
    

}
