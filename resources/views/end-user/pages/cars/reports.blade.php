@extends('end-user.layouts.app')

@section('content')

<main class="main">

    <!-- breadcrumb -->
    <div class="site-breadcrumb report">
        <div class="container">
            <ul class="nav nav-pills mb-3 d-flex justify-content-center" id="pills-tab" role="tablist">
                @foreach ($car->getReportsWithOptions() as $report)
                <li class="nav-item" role="presentation">
                    <button class="nav-link @if(request()->report ==  $report['id']) active @elseif(request()->report == null && $loop->first) active @endif" 
                        id="main-report-{{$report['id']}}-tab" data-bs-toggle="pill" data-bs-target="#report-{{$report['id']}}" 
                        type="button" role="tab" aria-controls="report-{{$report['id']}}" 
                        aria-selected="@if(request()->report ==  $report['id']) true @else false @endif">
                        {{$report['name']}}
                    </button>
                </li>
                @endforeach
            </ul>
        </div>
    </div>
    <!-- breadcrumb end -->

    <div class="container">
        <div class="row">
            <div class="col-2"></div>
            <div class="col-8">
                <!-- register area -->
                <div class="tab-content" id="pills-tabContent">
                    @foreach ($car->getReportsWithOptions() as $subReport)
                        <div class="tab-pane fade @if(request()->report == $subReport['id']) show active @elseif(request()->report == null && $loop->first) show active @endif" id="report-{{$subReport['id']}}" role="tabpanel" aria-labelledby="#report-{{$subReport['id']}}-tab">
                            <div class="car-single-widget">
                                <h4 class="mb-4">{{ $subReport['name'] }}</h4>
                                <div class="car-key-info">
                                    <div class="row">
                                        @foreach ($subReport['options'] as $option)
                                            <div class="col-12">
                                                <a @if($option['image'])  href="{{ $option['image'] }}" data-fancybox="gallery"  @endif class="d-block">
                                                    <div class="car-key-item">
                                                        <div class="car-key-icon">
                                                            <img src="{{ $option['icon'] }}" width="30" height="30" alt="">
                                                        </div>
                                                        <div class="car-key-content">
                                                            <div class="row">
                                                                <div class="col-6"> {{ $option['name'] }}</div>
                                                                <div class="col-6 text-end">
                                                                    @if($option['image'])
                                                                    <img src="{{ asset('end-user/assets/img/download/post_exclamation.svg') }}" loading="lazy" alt="">
                                                                    @else
                                                                    <img src="{{ asset('end-user/assets/img/download/post_check_mark.svg') }}" loading="lazy" alt="">
                                                                    @endif
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
                <!-- register area end -->
            </div>
            <div class="col-2"></div>
        </div>
    </div>

</main>

@endsection
