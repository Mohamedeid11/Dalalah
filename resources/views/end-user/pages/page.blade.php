@extends('end-user.layouts.app')

@section('content')
<main class="main">

    <!-- breadcrumb -->
    <div class="site-breadcrumb" style="background: url('{{ $page->getAvatar() }}')">
        <div class="container">
            <h2 class="breadcrumb-title"> {{ $page->name }}</h2>
            <ul class="breadcrumb-menu">
                <li><a href="{{ route('end-user.index') }}">Home</a></li>
                <li class="active"> {{ $page->name }}</li>
            </ul>
        </div>
    </div>
    <!-- breadcrumb end -->

    <!-- about area -->
    <div class="about-area py-120">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12">
                    <div class="about-right wow fadeInRight" data-wow-delay=".25s">
                        <div class="site-heading mb-3">
                            <span class="site-title-tagline justify-content-start">
                                {{ $page->name }}
                            </span>
                        </div>
                        <p class="about-text">
                            {!! $page->content !!}
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- about area end -->

</main>
@endsection
