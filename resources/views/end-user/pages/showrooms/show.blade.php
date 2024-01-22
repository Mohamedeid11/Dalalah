@extends('end-user.layouts.app')

@section('content')


<main class="main">

    <!-- breadcrumb -->
    <div class="site-breadcrumb" style="background: url({{ $showroom->getLogo() }})">
        <div class="container">
            <h2 class="breadcrumb-title">{{ $showroom->type }}</h2>
            <ul class="breadcrumb-menu">
                <li><a href="index.html">Home</a></li>
                <li class="active">{{ $showroom->showroom_name }}</li>
            </ul>
        </div>
    </div>
    <!-- breadcrumb end -->

    <!-- car single -->
    <div class="car-item-single bg py-120">
        <div class="container">
            <div class="car-single-wrapper">

                <div class="row">
                    <div class="col-lg-12">
                        <div class="car-single-details">
                            <div class="car-single-widget">
                                <div class="car-single-overview">
                                    <div class="row">
                                        <div class="col-3">
                                            <img src="{{ $showroom->getLogo() }}" style="width: 100%;height:300px" alt="banner">
                                        </div>
                                        <div class="col-9">
                                            <h4 class="mb-3">Description</h4>
                                            <div class="mb-4">
                                                <p>
                                                    {{ $showroom->description }}
                                                </p>
                                            </div>
                                            <div class="text-end">
                                                <div class="car-single-author-social ">
                                                    <a href="tel:{{ $showroom->phone }}" class="btn btn-primary"><i class="fas fa-phone"></i></a>
                                                    <a href="https://web.whatsapp.com/send?phone={{$showroom->whatsapp}}" class="btn btn-success"><i class="fab fa-whatsapp"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class=" car-single-widget my-2 ">

                                <ul class="nav nav-tabs cars-information" id="myTab" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link active" id="new-car-tab" data-bs-toggle="tab" data-bs-target="#new-car" type="button" role="tab" aria-controls="new-car" aria-selected="true">
                                            New Cars
                                        </button>
                                    </li>
                                    @if($showroom->type != 'agency')
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="used-car-tab" data-bs-toggle="tab" data-bs-target="#used-car" type="button" role="tab" aria-controls="used-car" aria-selected="false">
                                            Used Cars
                                        </button>
                                    </li>
                                    @endif
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="branchs-tab" data-bs-toggle="tab" data-bs-target="#branchs" type="button" role="tab" aria-controls="branchs" aria-selected="false">
                                            Branchs
                                        </button>
                                    </li>
                                </ul>

                            </div>

                            <div class="tab-content" id="myTabContent">

                                <div class="tab-pane fade show active" id="new-car" role="tabpanel" aria-labelledby="new-car-tab">
                                    <div class="row">
                                        @if(count($showroom->getNewCars()))
                                            @foreach ($showroom->getNewCars() as $newCar)
                                                <div class="col-md-6 col-lg-4 col-xl-3">
                                                    <div class="car-item wow fadeInUp" data-wow-delay=".50s">
                                                        <div class="car-img">
                                                            <span class="car-status status-2">New</span>
                                                            <img src="{{ $newCar->getLogo() }}" alt="" loading="lazy" style="height: 200px">
                                                            <div class="car-btns">
                                                                <a href="#"><i class="far fa-heart"></i></a>
                                                            </div>
                                                        </div>
                                                        <div class="car-content">
                                                            <div class="car-top">
                                                                <h4><a href="{{ route('end-user.cars.show',['car'=>1 , 'type'  => 'used'  ]) }}">{{ $newCar->title }}</a></h4>
                                                            </div>
                                                            <ul class="car-list">
                                                                <li><i class="far fa-steering-wheel"></i>{{ $newCar->drive_type }}</li>
                                                                <li><i class="far fa-car"></i>Model: {{ $newCar->year }}</li>
                                                            </ul>
                                                            <div class="car-footer">
                                                                <span class="car-price"> {{ $newCar->getPrice() }} L.E</span>
                                                                <a href="{{ route('end-user.cars.show', $newCar->id ) }}" class="theme-btn"><span class="far fa-eye"></span>Details</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            @endforeach
                                        @else
                                            <p class="text-center text-danger"> There is no new cars </p>
                                        @endif
                                    </div>
                                </div>

                                @if($showroom->type != 'agency')
                                    <div class="tab-pane fade" id="used-car" role="tabpanel" aria-labelledby="used-car-tab">

                                        <div class="row">
                                            @if(count($showroom->getUsedCars()))
                                                @foreach ($showroom->getUsedCars() as $usedCar)
                                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                                        <div class="car-item wow fadeInUp" data-wow-delay=".50s">
                                                            <div class="car-img">
                                                                <span class="car-status status-1">Used</span>
                                                                <img src="{{ $usedCar->getLogo() }}" alt="" loading="lazy" style="height: 200px">
                                                                <div class="car-btns">
                                                                    <a href="#"><i class="far fa-heart"></i></a>
                                                                </div>
                                                            </div>
                                                            <div class="car-content">
                                                                <div class="car-top">
                                                                    <h4><a href="{{ route('end-user.cars.show',$usedCar->id) }}">{{ $usedCar->title }}</a></h4>
                                                                </div>
                                                                <ul class="car-list">
                                                                    <li><i class="far fa-steering-wheel"></i>{{ $usedCar->drive_type }}</li>
                                                                    <li><i class="far fa-car"></i>Model: {{ $usedCar->year }}</li>
                                                                </ul>
                                                                <div class="car-footer">
                                                                    <span class="car-price">{{ $usedCar->price }} L.E</span>
                                                                    <a href="{{ route('end-user.cars.show', $usedCar->id ) }}" class="theme-btn"><span class="far fa-eye"></span>Details</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                @endforeach
                                            @else
                                                <p class="text-center text-danger"> There is no used cars </p>
                                            @endif
                                        </div>

                                    </div>
                                @endif

                                <div class="tab-pane fade" id="branchs" role="tabpanel" aria-labelledby="branchs-tab">
                                    <div class="row">
                                        @if(count($showroom->branches))
                                            @foreach ($showroom->branches as $branch)
                                                <div class="col-md-12 mb-2">
                                                    <div class="branch-container row p-5" style="background: white !important">
                                                        <div class="col-9">
                                                            <h4 class="mb-3"> {{ $branch->name }} </h4>
                                                            <p> {{ $branch->address }} </p>
                                                            <p> {{ $branch->city->name }} , {{ $branch->district->name }} </p>
                                                        </div>
                                                        <div class="col-3">
                                                            <div class="text-end ">
                                                                <a href="tel:{{ $branch->phone }}" class="btn btn-primary"><i class="fas fa-phone"></i></a>
                                                                <a href="https://web.whatsapp.com/send?phone={{$branch->whatsapp}}" class="btn btn-success"><i class="fab fa-whatsapp"></i></a>
                                                                <a href="{{ $branch->link }}" class="btn btn-danger"><i class="fas fa-map-marker-minus"></i></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            @endforeach
                                        @else
                                            <p class="text-center text-danger"> there is no branches </p>
                                        @endif
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- car single end -->
</main>

@endsection
