@extends('end-user.layouts.app')

@section('content')

<main class="main">

    <!-- breadcrumb -->
        <div class="site-breadcrumb" style="background: url('{{ $car->getLogo() }}')">
            <div class="container">
                <h2 class="breadcrumb-title"> {{TranslationHelper::translate('car' ,'site' )}} </h2>
                <ul class="breadcrumb-menu">
                    <li><a href="{{ route('admin.index') }}"> {{TranslationHelper::translate('home' ,'site' )}} </a></li>
                    {{-- <li class="active">{{ $car->title }}</li> --}}
                </ul>
            </div>
        </div>
    <!-- breadcrumb end -->

    <!-- car single -->
    <div class="car-item-single bg py-120">
        <div class="container">
            <div class="car-single-wrapper">

                <div class="row">
                    <div class="col-lg-8">
                        <div class="car-single-details">

                            <div class="car-single-widget">
                                <div class="car-single-top">

                                    <span class="car-status status-1">{{ $car->brand?->name }}</span>
                                    <span class="car-status status-1">{{ $car->brandModel?->name }}</span>
                                    <span class="car-status status-1">{{ $car->year }}</span>
                                    <span class="car-status status-1">{{TranslationHelper::translate($car->status ,'site' )}}  </span>

                                    <ul class="car-single-meta">
                                        <li><i class="far fa-clock"></i> {{TranslationHelper::translate('listed_on' ,'site' )}} : {{ $car->getCreatedAt() }}</li>
                                    </ul>

                                </div>
                                <div class="car-single-slider">
                                    <div class="item-gallery">
                                        <div class="flexslider-thumbnails">
                                            <ul class="slides">
                                                @if(count($car->getImages()))
                                                    @foreach ($car->getImages() as $image)
                                                        <li data-thumb="{{ $image['image'] }}">
                                                            <img src="{{ $image['image'] }}" loading="lazy" alt="#">
                                                        </li>
                                                    @endforeach
                                                @else
                                                    <li data-thumb="{{ $car->getLogo() }}">
                                                        <img src="{{ $car->getLogo() }}" loading="lazy" alt="#">
                                                    </li>
                                                @endif
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            @if($car->model_name == 'App\Models\Admin')
                            <div class=" car-single-widget my-2 ">
                                <ul class="nav nav-tabs cars-information" id="myTab" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#information" type="button" role="tab" aria-controls="information" aria-selected="true">
                                            {{TranslationHelper::translate('car_information' ,'site' )}}  
                                        </button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#report" type="button" role="tab" aria-controls="report" aria-selected="false">
                                           {{TranslationHelper::translate('inspection_report' ,'site' )}}  
                                        </button>
                                    </li>
                                </ul>
                            </div>
                            @endif

                            <div class="tab-content" id="myTabContent">

                                <div class="tab-pane fade show active" id="information" role="tabpanel" aria-labelledby="home-tab">
                                    <div class="car-single-widget">
                                        <h4 class="mb-4 text-center">   {{TranslationHelper::translate('car_information' ,'site' )}} </h4>
                                        <div class="accordion" id="accordionExample">
                                            @foreach ($car->getFeaturesWithOptions() as $key => $feature)
                                            <div class="accordion-item">
                                                <h2 class="accordion-header" id="headingOne-{{ $key }}">
                                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne-{{ $key }}" aria-expanded="false" aria-controls="collapseOne-{{ $key }}">
                                                        {{ $feature['name']  }}
                                                    </button>
                                                </h2>
                                                <div id="collapseOne-{{ $key }}" class="accordion-collapse collapse @if($loop->first)show @endif" aria-labelledby="headingOne-{{ $key }}" data-bs-parent="#accordionExample">
                                                    <div class="accordion-body">
                                                        <div class="car-key-info">
                                                            <div class="row">
                                                                @foreach ($feature['options'] as $option)
                                                                <div class="col-6">
                                                                    <div class="car-key-item">
                                                                        <div class="car-key-icon">
                                                                            <img src="{{ $option['icon'] }}" alt="{{ $option['name']}}-icon" loading="lazy" width="30" height="30">
                                                                            {{-- <i class="flaticon-drive"></i> --}}
                                                                        </div>
                                                                        <div class="car-key-content d-flex align-items-center">
                                                                            <span>{{ $option['name'] }} </span>
                                                                            {{-- <p class="text-dark"> Coupe</p> --}}
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                @endforeach
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>

                                @if($car->model_name == 'App\Models\Admin')
                                <div class="tab-pane fade" id="report" role="tabpanel" aria-labelledby="report-tab">
                                    <div class="car-single-widget">
                                        @if(count($car->reportOptions))
                                        <h4 class="mb-4 text-center"> {{TranslationHelper::translate('car_inspection_report' ,'site' )}} </h4>
                                        <div class="car-key-info">
                                            <div class="row">
                                             
                                                @foreach ($car->reportOptions()->paginate(20) as $report)
                                                <div class="col-6">
                                                    <a href="{{ route('end-user.cars.report', ['car' => $car->id , 'report' => $report->report_id ]  )}}" class="d-block">
                                                        <div class="car-key-item">

                                                            <div class="car-key-icon">
                                                                {{-- <i class="flaticon-drive"></i> --}}
                                                                <img src="{{ $report->getIcon() }}" loading="lazy" width="30" height="30" alt="">
                                                            </div>

                                                            <div class="car-key-content">
                                                                <div class="row">
                                                                    <div class="col-6"> {{ $report->name }} </div>
                                                                    <div class="col-6 text-end">
                                                                        @if($report->pivot->image)
                                                                            <img src="{{ asset('end-user/assets/img/download/post_exclamation.svg') }}" loading="lazy" alt="">
                                                                        @else
                                                                            <img src="{{ asset('end-user/assets/img/download/post_check_mark.svg') }}" loading="lazy" alt="">
                                                                        @endif
                                                                        {{-- <i class="far fa-angle-right"></i> --}}
                                                                        <img src="{{ asset('end-user/assets/img/download/mobileArrL.png') }}" loading="lazy" width="25" class="report-arrow" alt="">
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </a>
                                                </div>
                                                @endforeach
                                            </div>

                                            <div class="row">
                                                <div class="col-12 text-center">
                                                    <a href="{{ route('end-user.cars.report', $car->id)}}" class="btn btn-danger">
                                                     {{TranslationHelper::translate('view_full_inspection_report' ,'site' )}}   </a>
                                                </div>
                                            </div>
                                        </div>
                                        @else
                                        <p class="text-center text-danger">  {{TranslationHelper::translate('no_report_found' ,'site' )}} </p>
                                        @endif
                                    </div>
                                </div>
                                @endif

                            </div>

                            <div class="car-single-widget">
                                <div class="car-single-overview">
                                    <h4 class="mb-3"> {{TranslationHelper::translate('details' ,'site' )}} </h4>
                                    <div class="mb-4">
                                        <div class="row">
                                            <div class="col-6">
                                                <div class="car-key-item">
                                                    <div class="car-key-icon">
                                                        <i class="fas fa-car"></i>
                                                    </div>
                                                    <div class="car-key-content d-flex align-items-center">
                                                        <span> {{TranslationHelper::translate('car_type' ,'site' )}} :</span>
                                                        <span> {{ $car->carType?->name }} </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="car-key-item">
                                                    <div class="car-key-icon">
                                                        <i class="fas fa-gas-pump"></i>
                                                    </div>
                                                    <div class="car-key-content d-flex align-items-center">
                                                        <span> {{TranslationHelper::translate('fuel_type' ,'site' )}} :</span>
                                                        <span> {{TranslationHelper::translate(Str::replace('_' , ' ' ,$car->fuel_type) ,'site' )}} </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="car-key-item">
                                                    <div class="car-key-icon">
                                                        <i class="fas fa-tachometer-alt"></i>
                                                    </div>
                                                    <div class="car-key-content d-flex align-items-center">
                                                        <span> {{TranslationHelper::translate('drive_type' ,'site' )}} :</span>
                                                        <span> {{TranslationHelper::translate(Str::replace('_' , ' ' ,$car->drive_type) ,'site' )}}  </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="car-key-item">
                                                    <div class="car-key-icon">
                                                        <i class="fas fa-closed-captioning"></i>
                                                    </div>
                                                    <div class="car-key-content d-flex align-items-center">
                                                        <span> {{TranslationHelper::translate('engine' ,'site' )}} :</span>
                                                        <span> {{ $car->engine }} </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="car-key-item">
                                                    <div class="car-key-icon">
                                                        <i class="fas fa-palette"></i>
                                                    </div>
                                                    <div class="car-key-content d-flex align-items-center">
                                                         <span> {{TranslationHelper::translate('color' ,'site' )}} :</span>
                                                        <span> {{ $car->colorRelation?->name }} </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            @if ($car->description)
                            <div class="car-single-widget">
                                <div class="car-single-overview">
                                    <h4 class="mb-3"> {{TranslationHelper::translate('description' ,'site' )}} </h4>
                                    <div class="mb-4">
                                        <p> {{ $car->description }} </p>
                                    </div>
                                </div>
                            </div>
                            @endif

                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="car-single-widget custom">
                            <h4 class="car-single-price">{{ $car->getPrice() }} L.E</h4>
                            @if($car->model_name != 'App\Models\Admin')
                            <ul class="car-single-meta">
                                <li><i class="far fa-location-dot"></i> {{ $car->getAddress() }}</li>
                            </ul>
                            @endif
                        </div>
                        <div class="car-single-widget custom">
                            <h5> {{TranslationHelper::translate('seller_description' ,'site' )}} </h5>

                            <br>
                            <div class="car-single-author">
                                <img src="{{ $car->getModelObjectUserForWeb()['image'] }}" style="height:80px;" loading="lazy" alt="">
                                <div class="car-single-author-content">
                                    <h5>{{$car->getModelObjectUserForWeb()['name']}}</h5>
                                </div>
                            </div>
                            @if(auth('end-user')->check() || auth('showroom')->check())
                                <div class="car-single-author-social row">
                                    <div class="col-6 text-center"><a href="tel:{{$car->getModelObjectUserForWeb()['phone']}}" class="text-primary"><i class="fas fa-phone"></i></a></div>
                                    <div class="col-6 "><a href="https://web.whatsapp.com/send?phone={{$car->getModelObjectUserForWeb()['whatsapp']}}" class="text-success"><i class="fab fa-whatsapp"></i></a></div>
                                </div>
                            @else
                                <p>تظهر البيانات عند تسجيل الدخول</p>
                            @endif
                        </div>
                        <div class="car-single-widget">
                            <h4 class="mb-4">{{TranslationHelper::translate('showroom_same_cars' ,'site' )}}</h4>
                            <div class="car-key-info">
                                <div class="row justify-content-between align-items-center">
                                    @foreach ($showroomCars as $showroomCar)
                                    <div class="col-8">
                                        <div class="car-key-item">
                                            <div class="car-key-icon">
                                                <img src="{{ $showroomCar->showroom->getLogo() }}" loading="lazy" style="width:50px" alt="">
                                            </div>
                                            <div class="car-key-content">
                                                <span>{{ $showroomCar->showroom->showroom_name }}</span>
                                                <h6>{{ $showroomCar->title }}</h6>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <h6>{{$showroomCar->getPrice()}} {{TranslationHelper::translate('l_e' ,'site' )}} </h6>
                                    </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                @if(count($cars))
                <div class="car-single-related mt-5">
                    <h3 class="mb-30"> {{TranslationHelper::translate('related_cars' ,'site' )}} </h3>
                    <div class="row">
                        @foreach ($cars as $relatedCar)
                        <div class="col-md-6 col-lg-4 col-xl-3">
                            <div class="car-item">
                                <div class="car-img">
                                    {{-- <span class="car-status status-1">Used</span> --}}
                                    <img src="{{ $relatedCar->getLogo() }}" loading="lazy" style="height: 190px" alt="">
                                    <div class="car-btns">
                                        <a href="#"><i class="far fa-heart"></i></a>
                                        {{-- <a href="#"><i class="far fa-arrows-repeat"></i></a> --}}
                                    </div>
                                </div>
                                <div class="car-content">
                                    <div class="car-top">
                                        <h4><a href="{{ route('end-user.cars.show', $relatedCar->id ) }}"> {{ $relatedCar->title }} </a></h4>
                                    </div>
                                    <ul class="car-list">
                                        <li><i class="far fa-steering-wheel"></i>{{ $relatedCar->drive_type }}</li>
                                        <li><i class="far fa-car"></i> {{TranslationHelper::translate('model' ,'site' )}}: {{ $relatedCar->year }}</li>
                                        {{-- <li><i class="far fa-user"></i>User Or Showrooms or Agencies </li> --}}
                                    </ul>
                                    <div class="car-footer">
                                        <span class="car-price">{{ $relatedCar->getPrice() }} {{TranslationHelper::translate('l_e' ,'site' )}}</span>
                                        <a href="{{ route('end-user.cars.show', $relatedCar->id) }}" class="theme-btn"><span class="far fa-eye"></span>
                                           {{TranslationHelper::translate('details' ,'site' )}}  
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>
                @endif

            </div>
        </div>
    </div>
    <!-- car single end -->

</main>

@endsection

@push('styles')
    <link rel="stylesheet" href="{{ asset('end-user/assets/css/flex-slider.min.css') }}">
@endpush

@push('scripts')
    <script src="{{ asset('end-user/assets/js/flex-slider.js') }}"></script>
@endpush
