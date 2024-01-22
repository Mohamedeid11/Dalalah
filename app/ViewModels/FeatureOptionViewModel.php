<?php

namespace App\ViewModels;

use App\Models\Branch;
use App\Models\City;
use App\Models\Feature;
use App\Models\FeatureOption;
use App\Models\Showroom;
use Spatie\ViewModels\ViewModel;


class FeatureOptionViewModel extends ViewModel
{

    public function __construct(public ?Feature $feature, public ?FeatureOption $featureOption = null)
    {
        $this->featureOption  = is_null($featureOption) ? new FeatureOption(old()) : $featureOption;
    }

    public function action(): string
    {
        return is_null($this->featureOption ->id)
            ? route('admin.feature_option.store',  ['feature' => $this->feature->id])
            : route('admin.feature_option.update', ['feature' => $this->feature->id, 'feature_option' => $this->featureOption->id]);
    }

    public function method(): string
    {
        return is_null($this->featureOption->id) ? 'POST' : 'PUT';
    }   
    
}
