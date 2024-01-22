<div class="container">

    <div class="row">
        
        <div class="col-lg-3">
            <div class="car-sidebar">

                <div class="filter-box-container">
                    <div class="text-center">
                        <h4 class="text-center"> {{TranslationHelper::translate('brands' ,'site' )}}</h4>
                    </div>
                    <hr />
                    <ul>
                        @foreach ($brands as $brand)
                        <li>
                            <div class="form-check">
                                <input class="form-check-input" wire:model="selectedBrands" value="{{ $brand->id }}" :key="{{ $brand->id }}" type="checkbox">
                                <label class="form-check-label text-dark"> {{ $brand->name }} </label>
                            </div>
                        </li>
                        @endforeach
                    </ul>
                </div>

                @if(count($models))
                <div class="filter-box-container model">
                    <div class="text-center">
                        <h4 class="text-center"> {{TranslationHelper::translate('models' ,'site' )}} </h4>
                    </div>
                    <hr />
                    <ul>
                        @foreach ($models as $model)
                        <li>
                            <div class="form-check">
                                <input class="form-check-input" wire:model="selectedModels" value="{{ $model->id }}" type="checkbox">
                                <label class="form-check-label text-dark"> {{ $model->name }}</label>
                            </div>
                        </li>
                        @endforeach
                    </ul>
                </div>
                @endif

                @if(count($extensions))
                    <div class="filter-box-container model">
                        <div class="text-center">
                            <h4 class="text-center"> {{TranslationHelper::translate('extensions' ,'site' )}} </h4>
                        </div>
                        <hr />
                        <ul>
                            @foreach ($extensions as $extension)
                            <li>
                                <div class="form-check">
                                    <input class="form-check-input" wire:model="selectedExtensions" value="{{ $extension->id }}" type="checkbox">
                                    <label class="form-check-label text-dark">{{ $extension->name }}</label>
                                </div>
                            </li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                <div class="filter-box-container price">
                    <div class="text-center">
                        <h4 class="text-center"> {{TranslationHelper::translate('price_range' ,'site' )}} </h4>
                    </div>
                    <hr />
                    <div>
                        <input type="number" wire:model="fromPrice" placeholder="{{TranslationHelper::translate('from' ,'site' )}}" class="form-control">
                    </div>
                    <div class="mt-2">
                        <input type="number" wire:model="toPrice" placeholder="{{TranslationHelper::translate('to' ,'site' )}}" class="form-control">
                    </div>
                </div>

                <div class="filter-box-container model">
                    <div class="text-center">
                        <h4 class="text-center"> {{TranslationHelper::translate('years' ,'site' )}} </h4>
                    </div>
                    <hr />
                    <ul>
                      
                        @foreach($years as $yearDropdown)
                        <li>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="{{ $yearDropdown }}" wire:model="selectedYears">
                                <label class="form-check-label">{{$yearDropdown}}</label>
                            </div>
                        </li>
                        @endforeach
                    </ul>
                </div>

                <div class="filter-box-container transmission">
                    <div class="text-center">
                        <h4 class="text-center"> {{TranslationHelper::translate('transmission' ,'site' )}} </h4>
                    </div>
                    <hr />
                    <ul>
                        @foreach (getDriveTypes() as $dKey =>  $dType)
                            <li>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" wire:model="driveType" value="{{ $dType->key }}">
                                    <label class="form-check-label"> {{TranslationHelper::translate($dType->key ,'site' )}} </label>
                                </div>
                            </li>
                        @endforeach
                    </ul>
                </div>

                <div class="filter-box-container fuel">
                    <div class="text-center">
                        <h4 class="text-center"> {{TranslationHelper::translate('fuel_type' ,'site' )}} </h4>
                    </div>
                    <hr />
                    <ul>
                        @foreach (getFuelTypes() as $fType)
                            <li>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox"  wire:model="fuelType" value="{{ $fType->key }}">
                                    <label class="form-check-label"> {{TranslationHelper::translate($fType->key ,'site' )}} </label>
                                </div>
                            </li>
                        @endforeach
                    </ul>
                </div>

                <div class="filter-box-container">
                    <div class="text-center">
                        <h4 class="text-center"> {{TranslationHelper::translate('features' ,'site' )}} </h4>
                    </div>
                    <hr />
                    <ul>
                        @foreach ($features as $feature)
                        <li>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox"  wire:model="selectedFeatures" value="{{ $feature->id }}" id="{{ $feature->id }}">
                                <label class="form-check-label" for="{{ $feature->id }}"> {{ $feature->name }} </label>
                            </div>
                        </li>
                        @endforeach
                    </ul>
                </div>

            </div>
        </div>

        <div class="col-lg-9">
            {{-- <div class="col-md-12">
                <div class="car-sort">
                    <h6>Showing 1-10 of 50 Results</h6>
                    <div class="col-md-3 car-sort-box">
                        <select class="select">
                            <option value="2">Sort By Latest</option>
                            <option value="3">Sort By Low Price</option>
                            <option value="4">Sort By High Price</option>
                        </select>
                    </div>
                </div>
            </div> --}}

            <div class="row position-relative">

                <div wire:loading>
                    <div class="col-12 spinner-style-container">
                        <div class="spinner-border text-danger" role="status">
                            {{-- <span class="visually-hidden">Loading...</span> --}}
                        </div>
                    </div>
                </div>

            <div class="row">

                @foreach ($cars as $car)
                <div class="col-md-6 col-lg-4">
                    <div class="car-item">
                        <div class="car-img">
                            {{-- <span class="car-status status-1">Used</span> --}}
                            <img src="{{ $car->getLogo() }}" alt="" loading="lazy" style="width:100%;height: 200px;">
                            <x-favorite-icon :car="$car" />
                        </div>
                        <div class="car-content">
                            <div class="car-top">
                               <h4><a href="{{ route('end-user.cars.show', $car->id) }}">{{ $car->brand?->name }} , {{ $car->brandModel?->name }}</a></h4>
                            </div>
                            <ul class="car-list">
                                <li><i class="far fa-steering-wheel"></i> {{TranslationHelper::translate($car->drive_type ,'site' )}} </li>
                                <li><i class="far fa-car"></i> {{TranslationHelper::translate('model' ,'site' )}} : {{ $car->year }} </li>
                                {{-- <li><i class="far fa-user"></i> {{$car->getModelObjectUserForWeb()['name']}} </li> --}}
                            </ul>
                            <div class="car-footer">
                                <span class="car-price"> {{ $car->getPrice() }} L.E</span>
                                <a href="{{ route('end-user.cars.show', $car->id ) }}" class="theme-btn"><span class="far fa-eye"></span> {{TranslationHelper::translate('details' ,'site' )}} </a>
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
        </div>
    </div>
</div>
