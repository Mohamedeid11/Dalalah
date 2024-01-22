<?php

namespace App\ViewModels;

use App\Models\Color;
use App\Models\Job;
use App\Models\JobCategory;
use App\Models\Slider;
use Spatie\ViewModels\ViewModel;

class ColorViewModel extends ViewModel
{
     
    public function __construct(public ?Color $color = null)
    {
        $this->color = is_null($color) ? new Color(old()) : $color;
    }

    public function action(): string
    {
        return is_null($this->color->id)
            ? route('admin.color.store')
            : route('admin.color.update', ['color' => $this->color->id]);
    }

    public function method(): string
    {
        return is_null($this->color->id) ? 'POST' : 'PUT';
    }
    
}
