@extends('end-user.layouts.app')

@section('content')
<main class="main">

    <!-- breadcrumb -->
    <div class="site-breadcrumb" style="background: url('{{ asset('end-user/assets/img/breadcrumb/01.png')}}')">
        <div class="container">
            <h2 class="breadcrumb-title">Change Password</h2>
            <ul class="breadcrumb-menu">
                <li><a href="{{ route('end-user.index') }}">Home</a></li>
                <li class="active">Change Password</li>
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
                        <div class="row">

                            <div class="col-lg-12">
                                <div class="user-profile-card">
                                    <h4 class="user-profile-card-title">Change Password</h4>
                                    <div class="col-lg-12">
                                        <div class="user-profile-form">
                                            <form action="{{ route('end-user.change.password.action') }}" method="POST">
                                                @csrf
                                                <div class="form-group">
                                                    <label>Old Password</label>
                                                    <input type="password" name="old_password" class="form-control" placeholder="Old Password">
                                                    @error('old_password')
                                                    <span class="text-danger">{{ $message }}</span>
                                                    @enderror
                                                </div>
                                                <div class="form-group">
                                                    <label>New Password</label>
                                                    <input type="password" name="new_password" class="form-control" placeholder="New Password">
                                                    @error('new_password')
                                                    <span class="text-danger">{{ $message }}</span>
                                                    @enderror
                                                </div>
                                                <div class="form-group">
                                                    <label>Re-Type Password</label>
                                                    <input type="password" class="form-control" name="new_password_confirmation" placeholder="Re-Type Password">
                                                </div>
                                                <button  class="theme-btn my-3"><span class="far fa-key"></span> Change Password</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- user-profile end -->

</main>
@endsection
