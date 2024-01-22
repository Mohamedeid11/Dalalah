@extends('end-user.layouts.app')

@section('content')
<main class="main">

    <!-- breadcrumb -->
    <div class="site-breadcrumb" style="background: url('{{ asset('end-user/assets/img/breadcrumb/01.png')}}')">
        <div class="container">
            <h2 class="breadcrumb-title">My Favorites</h2>
            <ul class="breadcrumb-menu">
                <li><a href="{{ route('end-user.index') }}">Home</a></li>
                <li class="active">My Favorites</li>
            </ul>
        </div>
    </div>
    <!-- breadcrumb end -->

    <!-- user-profile -->
    <div class="user-profile py-120">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    @include('end-user.layouts.profile_sidebar')
                </div>

                <div class="col-lg-9">
                    <div class="user-profile-wrapper">
                        <div class="user-profile-card profile-favorite">
                            <h4 class="user-profile-card-title">My Favorites</h4>
                            <div class="row">
                                @foreach ($favorites as $favorite)
                                    <div class="col-md-6 col-lg-4">
                                        <div class="car-item wow fadeInUp" data-wow-delay=".25s">
                                            <div class="car-img">
                                                {{-- <span class="car-status status-1">Used</span> --}}
                                                <img src="{{ $favorite->getLogo() }}" alt="" loading="lazy" style="width:100%;height: 200px">
                                                <x-favorite-icon :car="$favorite" />
                                            </div>
                                            <div class="car-content">
                                                <div class="car-top">
                                                    <h4><a href="{{ route('end-user.cars.show', $favorite->id) }}">{{ $favorite->brand?->name }} , {{ $favorite->brandModel?->name }}</a></h4>
                                                </div>
                                                
                                                <ul class="car-list">
                                                    <li><i class="far fa-steering-wheel"></i>{{ $favorite->drive_type }}</li>
                                                    <li><i class="far fa-car"></i>Model: {{ $favorite->year }}</li>
                                                </ul>
                                                <div class="car-footer">
                                                    <span class="car-price">{{ $favorite->getPrice() }}L.E</span>
                                                    <a href="{{ route('end-user.cars.show',$favorite->id ) }}" class="theme-btn"><span class="far fa-eye"></span>Details</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                            <!-- pagination -->
                            {{-- <div class="pagination-area">
                                <div aria-label="Page navigation example">
                                    <ul class="pagination my-3">
                                        <li class="page-item">
                                            <a class="page-link" href="#" aria-label="Previous">
                                                <span aria-hidden="true"><i class="far fa-angle-double-left"></i></span>
                                            </a>
                                        </li>
                                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item">
                                            <a class="page-link" href="#" aria-label="Next">
                                                <span aria-hidden="true"><i class="far fa-angle-double-right"></i></span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div> --}}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- user-profile end -->

</main>
@endsection
