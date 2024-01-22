<?php

namespace App\ViewModels;

use App\Models\Brand;
use Spatie\ViewModels\ViewModel;

class BrandViewModel extends ViewModel
{
        
    public function __construct(public ?Brand $brand = null)
    {
        $this->brand = is_null($brand) ? new Brand(old()) : $brand;
    }

    public function action(): string
    {
        return is_null($this->brand->id)
            ? route('admin.brands.store')
            : route('admin.brands.update', ['brand' => $this->brand->id]);
    }

    public function method(): string
    {
        return is_null($this->brand->id) ? 'POST' : 'PUT';
    }
    
}
