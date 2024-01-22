@extends('end-user.layouts.app')

@section('content')

<main class="main">

    <!-- hero slider -->
    <div class="hero-section">
        <div class="hero-slider owl-carousel owl-theme">
            @foreach ( $sliders as $slider)
            <div class="hero-single" style="background: url({{ $slider->getAvatar() }});height: 80vh;">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-md-12 col-lg-6">
                            <div class="hero-content">
                                {{-- <h6 class="hero-sub-title" data-animation="fadeInUp" data-delay=".25s">Welcome To
                                    AutoMobile</h6> --}}
                                <h1 class="hero-title" data-animation="fadeInRight" data-delay=".50s">
                                    {{$slider->title}}
                                </h1>
                                {{-- <p data-animation="fadeInLeft" data-delay=".75s">
                                    There are many variations of passages orem psum available but the majority have
                                    suffered alteration in some form by injected humour.
                                </p> --}}
                                <div class="hero-btn" data-animation="fadeInUp" data-delay="1s">
                                    <a href="#\" class="theme-btn">
                                        @if(app()->getLocale() == 'ar') <i class="fas fa-arrow-left-long"></i> @endif
                                        {{TranslationHelper::translate('about_more' ,'site' )}}
                                        @if(app()->getLocale() == 'en') <i class="fas fa-arrow-right-long"></i> @endif
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-6">
                            <div class="hero-right">
                                <div class="hero-img">
                                    <img src="{{ $slider->getAvatar() }}" loading="lazy" alt="slider" style="height: 50vh;" data-animation="fadeInRight" data-delay=".25s">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
    <!-- hero slider end -->

    <!-- find car form -->
    <div class="find-car">
        <div class="container">
            <div class="find-car-form">
                <h4 class="find-car-title"> {{TranslationHelper::translate('let_find_your_perfect_car' ,'site' )}} </h4>
                <form action="{{ route('end-user.cars.index') }}" id="search_car">
                    <div class="row">
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label>{{TranslationHelper::translate('car_condition' ,'site' )}}</label>
                                <select class="select" required name="status">
                                    <option value="">{{TranslationHelper::translate('all_status' ,'site' )}} </option>
                                    @foreach (getCarStatus() as $statusType)
                                    <option value="{{ $statusType->key }}">
                                        {{TranslationHelper::translate($statusType->key ,'site' )}}
                                    </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label> {{TranslationHelper::translate('brand_name' ,'site' )}} </label>
                                <select class="select years-home" id="brand" required name="brand">
                                    <option value=""> {{TranslationHelper::translate('select_brand' ,'site' )}} </option>
                                    @foreach ($brands as $barndSelect)
                                    <option value="{{ $barndSelect->id }}">{{ $barndSelect->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label> {{TranslationHelper::translate('car_model' ,'site' )}} </label>
                                <select class="form-control" id="model" required name="car_model">
                                    <option value=""> {{TranslationHelper::translate('select_model' ,'site' )}} </option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label> {{TranslationHelper::translate('choose_year' ,'site' )}} </label>
                                <select class="select years-home" required name="year">
                                    @foreach ($years as $year)
                                    <option value="{{ $year }}">
                                        {{$year}}
                                    </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="col-lg-2 align-self-end">
                            <button class="theme-btn" type="submit"><span class="far fa-search"></span>
                                {{TranslationHelper::translate('find_your_car' ,'site' )}}
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- findcar form end -->

    <!-- about area -->
    <div class="about-area py-80">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <div class="about-left wow fadeInLeft" data-wow-delay=".25s">
                        <div class="about-img">
                            <img src="{{ asset('end-user/assets/img')}}/about/01.png" loading="lazy" alt="">
                        </div>
                        <div class="about-experience">
                            <div class="about-experience-icon">
                                <i class="flaticon-car"></i>
                            </div>
                            <b> {{TranslationHelper::translate('30_years' ,'site' )}} </b>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="about-right wow fadeInRight" data-wow-delay=".25s">
                        <div class="site-heading mb-3">
                            <span class="site-title-tagline justify-content-start">
                                <i class="flaticon-drive"></i> {{TranslationHelper::translate('about_us' ,'site' )}}
                            </span>
                            <h2 class="site-title">
                                {{ setting('about_section_title') }}
                            </h2>
                        </div>
                        <p class="about-text">
                            {{ setting('about_section_content') }}
                        </p>

                        <a href="#\" class="theme-btn mt-4">
                            @if(app()->getLocale() == 'ar') <i class="fas fa-arrow-left-long"></i> @endif
                            {{TranslationHelper::translate('discover_more' ,'site' )}}
                            @if(app()->getLocale() == 'en') <i class="fas fa-arrow-right-long"></i> @endif
                        </a>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- about area end -->

    <!-- car area -->
    <div class="car-area bg py-80">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 mx-auto">
                    <div class="site-heading text-center">
                        <span class="site-title-tagline"><i class="flaticon-drive"></i> {{TranslationHelper::translate('new_arrivals' ,'site' )}} </span>
                        <h2 class="site-title"> {{ TranslationHelper::translate('automobile_cars' ,'site' ) }} </h2>
                        <div class="heading-divider"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                @foreach ($adminCars as $adminCar)
                <div class="col-md-6 col-lg-4 col-xl-3">
                    <div class="car-item wow fadeInUp" data-wow-delay=".25s">
                        <div class="car-img">
                            @if($adminCar->status_buyed == 'buyed')
                            <span class="car-status status-1"> {{TranslationHelper::translate('sold' ,'site' )}} </span>
                            @else
                            <span class="car-status status-2"> {{TranslationHelper::translate('available' ,'site' )}} </span>
                            @endif
                            <img src="{{ $adminCar->getLogo() }}" alt="" loading="lazy" style="width:100%;height: 200px">
                            <x-favorite-icon :car="$adminCar" />
                        </div>
                        <div class="car-content">
                            <div class="car-top">
                                <h4><a href="{{ route('end-user.cars.show', $adminCar->id) }}">{{ $adminCar->brand?->name }} , {{ $adminCar->brandModel?->name }}</a></h4>
                            </div>
                            <ul class="car-list">
                                <li><i class="far fa-steering-wheel"></i> {{ TranslationHelper::translate($adminCar->drive_type ,'site' )  }}</li>
                                <li><i class="far fa-car"></i> {{TranslationHelper::translate('year' ,'site' )}} : {{ $adminCar->year }}</li>
                            </ul>
                            <div class="car-footer">
                                <span class="car-price">{{ $adminCar->getPrice() }} L.E</span>
                                <a href="{{ route('end-user.cars.show',$adminCar->id ) }}" class="theme-btn"><span class="far fa-eye"></span> {{TranslationHelper::translate('details' ,'site' )}} </a>
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
            <div class="text-center mt-4">
                <a href="{{ route('end-user.cars.index','used') }}" class="theme-btn"> {{TranslationHelper::translate('see_more' ,'site' )}}</a>
            </div>
        </div>
    </div>
    <!-- car area end -->

    <!-- car dealer -->
    <div class="car-dealer py-80">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 mx-auto">
                    <div class="site-heading text-center">
                        <span class="site-title-tagline"><i class="flaticon-drive"></i> {{TranslationHelper::translate('car' ,'site' )}} </span>
                        <h2 class="site-title"> {{TranslationHelper::translate('the_best_in_your_city' ,'site' )}} </h2>
                        <div class="heading-divider"></div>
                        <ul class="nav nav-pills my-3 d-flex justify-content-center" id="pills-tab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="agency-tab" data-bs-toggle="pill" data-bs-target="#agency" type="button" role="tab" aria-controls="agency" aria-selected="true">
                                    {{TranslationHelper::translate('agency' ,'site' )}}</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="showroom-tab" data-bs-toggle="pill" data-bs-target="#showroom" type="button" role="tab" aria-controls="showroom" aria-selected="false">
                                    {{TranslationHelper::translate('showroom' ,'site' )}}</button>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- register area -->
            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="agency" role="tabpanel" aria-labelledby="agency-tab">
                    <!-- register area end -->
                    <div class="row">
                        @foreach ($agencies as $agency)
                        <div class="col-md-6 col-lg-3">
                            <div class="dealer-item wow fadeInUp" data-wow-delay="1s">
                                <div class="dealer-img">
                                    <span class="dealer-listing">{{$agency->cars_count}} {{TranslationHelper::translate('listing' ,'site' )}} </span>
                                    <img src="{{ $agency->getLogo() }}" alt="" loading="lazy" style="width: 100%;height:130px;">
                                </div>
                                <div class="dealer-content">
                                    <h4>
                                        <a href="{{ route('end-user.showrooms.show',$agency->id) }}">
                                            {{ $agency->showroom_name }}
                                        </a>
                                    </h4>
                                    <ul>
                                        <li><i class="far fa-location-dot"></i> {{ $agency->branches_count  ?? 0 }} {{TranslationHelper::translate('branches' ,'site' )}} </li>
                                        <li><i class="far fa-phone"></i> <a href="tel:{{ $agency->phone }}">{{ $agency->phone }}</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </div>
                    <div class="text-center mt-4">
                        <a href="{{ route('end-user.showrooms.index','agency') }}" class="theme-btn"> {{TranslationHelper::translate('see_more' ,'site' )}} </a>
                    </div>
                </div>
                <div class="tab-pane fade" id="showroom" role="tabpanel" aria-labelledby="showroom-tab">
                    <!-- register area end -->
                    <div class="row">
                        @foreach ($showrooms as $showroom)
                        <div class="col-md-6 col-lg-3">
                            <div class="dealer-item wow fadeInUp" data-wow-delay="1s">
                                <div class="dealer-img">
                                    <span class="dealer-listing">{{$showroom->cars_count}} {{TranslationHelper::translate('listing' ,'site' )}} </span>
                                    <img src="{{ $showroom->getLogo() }}" alt="" loading="lazy" style="width: 100%;height:130px;">
                                </div>
                                <div class="dealer-content">
                                    <h4>
                                        <a href="{{ route('end-user.showrooms.show',$showroom->id) }}">
                                            {{ $showroom->showroom_name }}
                                        </a>
                                    </h4>
                                    <ul>
                                        <li><i class="far fa-location-dot"></i> {{ $showroom->branches_count  ?? 0 }} {{TranslationHelper::translate('branches' ,'site' )}} </li>
                                        <li><i class="far fa-phone"></i> <a href="tel:{{ $showroom->phone }}">{{ $showroom->phone }}</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </div>
                    <div class="text-center mt-4">
                        <a href="{{ route('end-user.showrooms.index','showroom') }}" class="theme-btn"> {{TranslationHelper::translate('see_more' ,'site' )}} </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- car dealer end-->

    <!-- car area -->
    <div class="car-area bg py-80">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 mx-auto">
                    <div class="site-heading text-center">
                        <span class="site-title-tagline"><i class="flaticon-drive"></i> {{TranslationHelper::translate('new_arrivals' ,'site' )}} </span>
                        <h2 class="site-title"> {{TranslationHelper::translate('used_car' ,'site' )}} </h2>
                        <div class="heading-divider"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                @foreach ($userCars as $userCar)
                <div class="col-md-6 col-lg-4 col-xl-3">
                    <div class="car-item wow fadeInUp" data-wow-delay=".25s">
                        <div class="car-img">
                            {{-- <span class="car-status status-1">Used</span> --}}
                            <img src="{{ $userCar->getLogo() }}" alt="" loading="lazy" style="width:100%; height: 200px;">
                            <x-favorite-icon :car="$userCar" />
                        </div>
                        <div class="car-content">
                            <div class="car-top">
                                <h4><a href="{{ route('end-user.cars.show', $userCar->id) }}">{{ $adminCar->brand?->name }} , {{ $adminCar->brandModel?->name }}</a></h4>
                            </div>
                            <ul class="car-list">
                                <li><i class="far fa-steering-wheel"></i> {{ $userCar->drive_type }}</li>
                                <li><i class="far fa-car"></i> {{TranslationHelper::translate('year' ,'site' )}} : {{ $userCar->year }}</li>
                            </ul>
                            <div class="car-footer">
                                <span class="car-price">{{ $userCar->getPrice() }} L.E</span>
                                <a href="{{ route('end-user.cars.show',$userCar->id ) }}" class="theme-btn"><span class="far fa-eye"></span>
                                    {{TranslationHelper::translate('details' ,'site' )}} </a>
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
            <div class="text-center mt-4">
                <a href="{{ route('end-user.cars.index','used') }}" class="theme-btn"> {{TranslationHelper::translate('see_more' ,'site' )}} </a>
            </div>
        </div>
    </div>
    <!-- car area end -->


    <!-- car brand -->
    <div class="car-brand py-80">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 mx-auto">
                    <div class="site-heading text-center">
                        <span class="site-title-tagline"><i class="flaticon-drive"></i> {{TranslationHelper::translate('popular_brands' ,'site' )}} </span>
                        <h2 class="site-title"> {{TranslationHelper::translate('our_top_quality_brands' ,'site' )}} </h2>
                        <div class="heading-divider"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="brand-slider owl-carousel owl-theme">
                    @foreach ($brands as $brand)
                    <div class="">
                        <a href="#" class="brand-item wow fadeInUp" data-wow-delay=".25s">
                            <div class="brand-img mb-2">
                                <img src="{{ $brand->getAvatar() }}" alt="" loading="lazy" style="height: 100px;width:100px">
                            </div>
                            <h5>{{$brand->name}}</h5>
                        </a>
                    </div>
                    @endforeach
                </div>

            </div>
            <div class="text-center mt-4">
                <a href="#/" class="theme-btn"> {{TranslationHelper::translate('see_more' ,'site' )}} </a>
            </div>
        </div>
    </div>
    <!-- car brand end-->

    <!-- download area -->
    <div class="download-area mb-120">
        <div class="container">
            <div class="download-wrapper">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="download-content">
                            <div class="site-heading mb-4">
                                <span class="site-title-tagline justify-content-start">
                                    <i class="flaticon-drive"></i> {{TranslationHelper::translate('get_our_app' ,'site' )}}
                                </span>
                                <h2 class="site-title mb-10">{{ setting('show_section_title') }}</h2>
                                <p>
                                    {{ setting('show_section_content') }}
                                </p>
                            </div>
                            <div class="download-btn">
                                <a href=" {{ setting('download_playstore','en') }}" target="_blank">
                                    <i class="fab fa-google-play"></i>
                                    <div class="download-btn-content">
                                        <span> {{TranslationHelper::translate('get_it_on' ,'site' )}} </span>
                                        <strong> {{TranslationHelper::translate('google_play' ,'site' )}} </strong>
                                    </div>
                                </a>
                                <a href="{{ setting('download_appstore','en') }}" target="_blank">
                                    <i class="fab fa-app-store"></i>
                                    <div class="download-btn-content">
                                        <span>{{TranslationHelper::translate('get_it_on' ,'site' )}}</span>
                                        <strong>{{TranslationHelper::translate('app_store' ,'site' )}} </strong>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="download-img">
                    <img src="{{ setting('show_section_img') }}" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- download area end -->

</main>

@endsection

@push('scripts')
<script>
    $('#brand').on('change', function() {
        let $brandId = this.value;
        getModels($brandId);
    });

    function getModels(brandId) {
        if (brandId) {
            $.ajax({
                url: "{{ route('ajax.get.models') }}"
                , type: "GET"
                , data: {
                    "_token": "{{ csrf_token() }}"
                    , value: brandId
                , }
                , dataType: "json"
                , success: function(data) {
                    if (data) {
                        $('#model').empty();
                        $('#model').focus;
                        $('#model').append('<option value="" disabled selected>-- Select Model1 --</option>');
                        let array = data.data;
                        array.forEach(myFunction);

                        function myFunction(item, index) {
                            select = `<option value="${item.id}">${item.name.en}</option>`;
                            // li = `<li data-value="${item.id}" class="option">${item.name.en}</li>`;
                            $('#model').append(select);
                        }
                    }
                }
            });
        } else {
            $('#model').empty();
        }
    }

    $(function() {
        $("#search_car").validate({
            // Specify validation rules
            rules: {
                //
            },
            // Specify validation error messages
            messages: {
                //
            }
            , highlight: function(element) {
                $(element).parent().addClass('error')
            }
            , unhighlight: function(element) {
                $(element).parent().removeClass('error')
            },
            // Make sure the form is submitted to the destination defined
            // in the "action" attribute of the form when valid
            submitHandler: function(form) {
                $(".submit").css('background-color', 'green');
                $(".submit").attr('disabled', 'disabled');
                form.submit();
            }
        });
    });

</script>
@endpush
