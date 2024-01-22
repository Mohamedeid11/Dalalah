@extends('end-user.layouts.app')

@section('content')
<main class="main">

    <!-- breadcrumb -->
    <div class="site-breadcrumb" style="background: url('{{ asset('end-user/assets/img/breadcrumb/01.png')}}')">
        <div class="container">
            <h2 class="breadcrumb-title">   {{TranslationHelper::translate('cars' ,'site' )}}  </h2>
            <ul class="breadcrumb-menu">
                <li><a href="{{ route('end-user.index') }}"> {{TranslationHelper::translate('home' ,'site' )}} </a></li>
                {{-- <li class="active">Cars</li> --}}
            </ul>
        </div>
    </div>
    <!-- breadcrumb end -->

    <!-- car area -->
    <div class="car-area grid bg py-120">
        @livewire('end-user.filter-car')
    </div>
    <!-- car area end -->

</main>
@endsection
