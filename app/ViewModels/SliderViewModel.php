<?php

namespace App\ViewModels;

use App\Models\Job;
use App\Models\JobCategory;
use App\Models\Slider;
use Spatie\ViewModels\ViewModel;

class SliderViewModel extends ViewModel
{
     
    public function __construct(public ?Slider $slider = null)
    {
        $this->slider = is_null($slider) ? new Slider(old()) : $slider;
    }

    public function action(): string
    {
        return is_null($this->slider->id)
            ? route('admin.slider.store')
            : route('admin.slider.update', ['slider' => $this->slider->id]);
    }

    public function method(): string
    {
        return is_null($this->slider->id) ? 'POST' : 'PUT';
    }
    
}
