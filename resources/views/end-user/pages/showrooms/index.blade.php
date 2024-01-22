@extends('end-user.layouts.app')

@section('content')
<main class="main">

    <!-- breadcrumb -->
    <div class="site-breadcrumb" style="background: url('{{ asset('end-user/assets/img/breadcrumb/01.png')}}')">
        <div class="container">
            <h2 class="breadcrumb-title">Showrooms / Agencies</h2>
            <ul class="breadcrumb-menu">
                <li><a href="{{ route('end-user.index') }}">Home</a></li>
                <li class="active">Showrooms / Agencies</li>
            </ul>
        </div>
    </div>
    <!-- breadcrumb end -->

    <!-- car area -->
    <div class="car-area grid bg py-120">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="col-md-12">
                        <div class="car-sort">
                            <h6>Showing 1-10 of 50 Results</h6>
                            <div class="col-md-3 car-sort-box">
                                <select class="select">
                                    <option value="1">Sort By Default</option>
                                    <option value="5">Sort By Featured</option>
                                    <option value="2">Sort By Latest</option>
                                    <option value="3">Sort By Low Price</option>
                                    <option value="4">Sort By High Price</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-lg-3">
                            <div class="dealer-item wow fadeInUp" data-wow-delay=".25s">
                                <div class="dealer-img">
                                    <span class="dealer-listing">25 Listing</span>
                                    <img src="{{ asset('end-user/assets/img')}}/dealer/01.png" alt="">
                                </div>
                                <div class="dealer-content">
                                    <h4><a href="#">Automotive Gear</a></h4>
                                    <ul>
                                        <li><i class="far fa-location-dot"></i> Cairo , Egypt</li>
                                        <li><i class="far fa-phone"></i> <a href="tel:+21236547898">01020304050</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                         <div class="col-md-6 col-lg-3">
                            <div class="dealer-item wow fadeInUp" data-wow-delay=".25s">
                                <div class="dealer-img">
                                    <span class="dealer-listing">25 Listing</span>
                                    <img src="{{ asset('end-user/assets/img')}}/dealer/01.png" alt="">
                                </div>
                                <div class="dealer-content">
                                    <h4><a href="#">Automotive Gear</a></h4>
                                    <ul>
                                        <li><i class="far fa-location-dot"></i> Cairo , Egypt</li>
                                        <li><i class="far fa-phone"></i> <a href="tel:+21236547898">01020304050</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                         <div class="col-md-6 col-lg-3">
                            <div class="dealer-item wow fadeInUp" data-wow-delay=".25s">
                                <div class="dealer-img">
                                    <span class="dealer-listing">25 Listing</span>
                                    <img src="{{ asset('end-user/assets/img')}}/dealer/01.png" alt="">
                                </div>
                                <div class="dealer-content">
                                    <h4><a href="#">Automotive Gear</a></h4>
                                    <ul>
                                        <li><i class="far fa-location-dot"></i> Cairo , Egypt</li>
                                        <li><i class="far fa-phone"></i> <a href="tel:+21236547898">01020304050</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- car area end -->

</main>
@endsection
