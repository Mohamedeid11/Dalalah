@extends('end-user.layouts.app')

@section('content')
<main class="main">

    <!-- breadcrumb -->
    <div class="site-breadcrumb" style="background: url('{{ asset('end-user/assets/img/breadcrumb/01.png')}}')">
        <div class="container">
            <h2 class="breadcrumb-title">Profile</h2>
            <ul class="breadcrumb-menu">
                <li><a href="{{ route('end-user.index') }}">Home</a></li>
                <li class="active">Profile</li>
            </ul>
        </div>
    </div>
    <!-- breadcrumb end -->

    <!-- user-profile -->
    <div class="user-profile py-120">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    @include('showroom.layouts.profile_sidebar')
                </div>
                <div class="col-lg-9">
                    <div class="user-profile-wrapper">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="user-profile-card">
                                    <h4 class="user-profile-card-title">Profile Info</h4>
                                    <div class="user-profile-form">
                                        <form action="{{ route('showroom.update.profile') }}" method="POST" enctype="multipart/form-data">
                                            @csrf

                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>owner name</label>
                                                        <input type="text" class="form-control" name="owner_name" value="{{ auth('showroom')->user()->owner_name }}" required placeholder="owner_name">
                                                        @error('owner_name')
                                                        <span class="text-danger" role="alert">
                                                            <strong>{{ $message }}</strong>
                                                        </span>
                                                        @enderror
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>showroom name</label>
                                                        <input type="text" class="form-control" name="showroom_name" value="{{ auth('showroom')->user()->showroom_name }}" placeholder="showroom_name" required>
                                                        @error('showroom_name')
                                                        <span class="text-danger" role="alert">
                                                            <strong>{{ $message }}</strong>
                                                        </span>
                                                        @enderror
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Phone</label>
                                                        <input type="number" class="form-control" name="phone" value="{{ auth('showroom')->user()->phone }}" required placeholder="Phone">
                                                        @error('phone')
                                                        <span class="text-danger" role="alert">
                                                            <strong>{{ $message }}</strong>
                                                        </span>
                                                        @enderror
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Whatsapp</label>
                                                        <input type="number" class="form-control" name="whatsapp" value="{{ auth('showroom')->user()->whatsapp }}" required placeholder="whatsapp">
                                                        @error('whatsapp')
                                                        <span class="text-danger" role="alert">
                                                            <strong>{{ $message }}</strong>
                                                        </span>
                                                        @enderror
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Logo</label>
                                                        <input type="file" class="form-control" name="image">
                                                        @error('image')
                                                        <span class="text-danger" role="alert">
                                                            <strong>{{ $message }}</strong>
                                                        </span>
                                                        @enderror
                                                    </div>
                                                </div>

                                                 <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Note</label>
                                                        <textarea name="description" class="form-control" cols="5" rows="5">  {{ auth('showroom')->user()->description }} </textarea>
                                                        @error('description')
                                                        <span class="text-danger" role="alert">
                                                            <strong>{{ $message }}</strong>
                                                        </span>
                                                        @enderror
                                                    </div>
                                                </div>

                                            </div>
                                            <button class="theme-btn my-3"><span class="far fa-user"></span> Save Changes</button>
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
    <!-- user-profile end -->

</main>
@endsection
