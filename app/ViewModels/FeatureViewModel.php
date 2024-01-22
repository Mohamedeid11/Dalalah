<?php

namespace App\ViewModels;

use App\Models\Feature;
use Spatie\ViewModels\ViewModel;

class FeatureViewModel extends ViewModel
{
        
    public function __construct(public ?Feature $feature = null)
    {
        $this->feature = is_null($feature) ? new Feature(old()) : $feature;
    }

    public function action(): string
    {
        return is_null($this->feature->id)
            ? route('admin.feature.store')
            : route('admin.feature.update', ['feature' => $this->feature->id]);
    }

    public function method(): string
    {
        return is_null($this->feature->id) ? 'POST' : 'PUT';
    }
    
}
