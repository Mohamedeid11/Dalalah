@extends('end-user.layouts.app')

@section('content')
<main class="main">

    <!-- breadcrumb -->
    <div class="site-breadcrumb" style="background: url('{{ asset('end-user/assets/img/breadcrumb/01.png')}}')">
        <div class="container">
            <h2 class="breadcrumb-title">{{ TranslationHelper::translate('login' ,'site' ) }}</h2>
            <ul class="breadcrumb-menu">
                <li><a href="{{ route('end-user.index') }}">{{ TranslationHelper::translate('home' ,'site' ) }}</a></li>
                <li class="active">{{ TranslationHelper::translate('login' ,'site' ) }}</li>
            </ul>
        </div>
    </div>
    <!-- breadcrumb end -->

    <!-- login area -->
    <div class="login-area py-120">
        <div class="container">
            <div class="col-md-5 mx-auto">
                <div class="login-form">
                    <div class="login-header m-0">
                        <img src="{{ asset('end-user/assets/img/logo/logo-nav.png') }} " alt="">
                    </div>

                    <form action="{{ route('showroom.action') }}"  method="POST">
                        @csrf 

                        {{-- <div class="row mb-3">
                            <div class="col-6 text-center">
                                <p> Showroom </p>
                                <input type="radio" value="showroom" name="type" checked>
                            </div>
                            <div class="col-6 text-center">
                                <p> Agency </p>
                                <input type="radio" value="agency" name="type">
                            </div>
                        </div> --}}

                        <div class="form-group">
                            <label>{{ TranslationHelper::translate('code' ,'site' ) }}</label>
                            <input type="text" class="form-control" name="code" placeholder="{{ TranslationHelper::translate('code' ,'site' ) }}" value="{{ old('code') }}">
                            @error('code')
                                <span class="text-danger" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>

                        <div class="form-group">
                            <label>{{ TranslationHelper::translate('password' ,'site' ) }}</label>
                            <input type="password" class="form-control" name="password" placeholder="{{ TranslationHelper::translate('password' ,'site' ) }}">
                            @error('password')
                                <span class="text-danger" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>

                        <div class="d-flex justify-content-between mb-4">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="remember">
                                <label class="form-check-label" for="remember">
                                  {{ TranslationHelper::translate('remember_me' ,'site' ) }}
                                </label>
                            </div>
                            {{-- <a href="#\" class="forgot-pass">Forgot Password?</a> --}}
                        </div>

                        <div class="d-flex align-items-center">
                            <button type="submit" class="theme-btn"><i class="far fa-sign-in"></i> {{ TranslationHelper::translate('login' ,'site' ) }}</button>
                        </div>
                        
                    </form>
                    {{-- <div class="login-footer">
                        <p>Don't have an account? <a href="{{ route('end-user.register') }}">Register.</a></p>
                    <div class="social-login">
                        <p>Continue with social media</p>
                        <div class="social-login-list">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-google"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                        </div>
                    </div>
                </div> --}}
            </div>
        </div>
    </div>
    </div>
    <!-- login area end -->

</main>
@endsection
