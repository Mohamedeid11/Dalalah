@extends('end-user.layouts.app')

@section('content')
<main class="main">

    <!-- breadcrumb -->
    <div class="site-breadcrumb" style="background: url('{{ asset('end-user/assets/img/breadcrumb/01.png')}}')">
        <div class="container">
            <h2 class="breadcrumb-title">{{ TranslationHelper::translate('register' ,'site' ) }}</h2>
            <ul class="breadcrumb-menu">
                <li><a href="{{ route('end-user.index') }}">{{ TranslationHelper::translate('home' ,'site' ) }}</a></li>
                <li class="active">{{ TranslationHelper::translate('register' ,'site' ) }}</li>
            </ul>
        </div>
    </div>
    <!-- breadcrumb end -->

    <!-- register area -->
    <div class="login-area py-120">
        <div class="container">
            <div class="col-md-5 mx-auto">
                <div class="login-form">
                    <div class="login-header">
                        <p>{{ TranslationHelper::translate('create_your_account' ,'site' ) }}</p>
                    </div>
                    <form action="{{ route('end-user.register.action') }}" method="POST">
                        @csrf

                        <div class="form-group">
                            <label>Full Name</label>
                            <input type="text" class="form-control" name="name" placeholder="{{ TranslationHelper::translate('name' ,'site' ) }}" value="{{ old('name') }}" required>
                            @error('name')
                                <span class="text-danger" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                        <div class="form-group">
                            <label>{{ TranslationHelper::translate('email_address' ,'site' ) }}</label>
                            <input type="email" class="form-control" name="email" placeholder="{{ TranslationHelper::translate('email_address' ,'site' ) }}" value="{{ old('email') }}" required>
                            @error('email')
                                <span class="text-danger" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                        <div class="form-group">
                            <label>{{ TranslationHelper::translate('phone' ,'site' ) }}</label>
                            <input type="phone" class="form-control" name="phone" placeholder="{{ TranslationHelper::translate('phone' ,'site' ) }}" value="{{ old('phone') }}" required>
                            @error('phone')
                                <span class="text-danger" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                        <div class="form-group">
                            <label>{{ TranslationHelper::translate('password' ,'site' ) }}</label>
                            <input type="password" class="form-control" placeholder="{{ TranslationHelper::translate('password' ,'site' ) }}" name="password" required>
                            @error('password')
                                <span class="text-danger" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                        <div class="form-group">
                            <label>{{ TranslationHelper::translate('confirm_password' ,'site' ) }} </label>
                            <input type="password" class="form-control" name="password_confirmation" placeholder="{{ TranslationHelper::translate('confirm_password' ,'site' ) }}" required>
                            @error('password_confirmation')
                                <span class="text-danger" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                        <div class="form-check form-group">
                            <input class="form-check-input" type="checkbox" required id="agree">
                            <label class="form-check-label" for="agree">
                              {{ TranslationHelper::translate('i_agree_with_the_terms_of_service' ,'site' ) }}  
                            </label>
                        </div>

                        <div class="d-flex align-items-center">
                            <button type="submit" class="theme-btn"><i class="far fa-paper-plane"></i> {{ TranslationHelper::translate('register' ,'site' ) }}</button>
                        </div>
                    </form>
                    <div class="login-footer">
                        <p>{{ TranslationHelper::translate('already_have_an_account?' ,'site' ) }}<a href="{{ route('end-user.login') }}">{{ TranslationHelper::translate('login' ,'site' ) }}.</a></p>
                        {{-- <div class="social-login">
                            <p>Continue with social media</p>
                            <div class="social-login-list">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-google"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                            </div>
                        </div> --}}
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- register area end -->

</main>
@endsection
