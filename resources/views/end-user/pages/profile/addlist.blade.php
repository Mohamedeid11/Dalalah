@extends('end-user.layouts.app')

@section('content')
<main class="main">

    <!-- breadcrumb -->
    <div class="site-breadcrumb" style="background: url('{{ asset('end-user/assets/img/breadcrumb/01.png')}}')">
        <div class="container">
            <h2 class="breadcrumb-title">Profile</h2>
            <ul class="breadcrumb-menu">
                <li><a href="{{ route('end-user.index') }}">Home</a></li>
                <li class="active">Dashboard</li>
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
                        <div class="user-profile-card">
                            <h4 class="user-profile-card-title">Add Listing</h4>
                            <div class="col-lg-12">
                                <div class="add-listing-form">
                                    <h6 class="mb-1">Basic Information</h6>
                                    <form action="{{ route('end-user.store.car') }}" method="POST" id="add_car" enctype="multipart/form-data">
                                        @csrf
                                        <div class="row align-items-center">

                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Brand</label>
                                                    <select name="brand_id" id="brand" class="form-control" required>
                                                        <option value="">Choose Brand</option>
                                                        @foreach ($brands as $brand)
                                                        <option value="{{ $brand->id }}">
                                                            {{ $brand->name }}
                                                        </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Model</label>
                                                    <select class="form-control" name="car_model_id" id="model" required>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Extenstion</label>
                                                    <select class="form-control" name="car_model_extension_id" id="extension" required>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Body Type</label>
                                                    <select class="form-control" name="car_type_id" required>
                                                        <option value="">Choose</option>
                                                        @foreach ($bodyTypes as $bodyType)
                                                        <option value="{{$bodyType->id}}">{{$bodyType->name}}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Price</label>
                                                    <input type="number" name="price" class="form-control" placeholder="Enter price" required>
                                                </div>
                                            </div>

                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Year</label>
                                                    <select class="form-control" name="year" required>
                                                        <option value="">Choose</option>
                                                        @foreach ($years as $year)
                                                        <option value="{{ $year }}">{{$year}}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Fuel Type</label>
                                                    <select class="form-control" name="fuel_type" required>
                                                        <option value="">Choose</option>
                                                        @foreach (getFuelTypes() as $fuelType)
                                                        <option value="{{ $fuelType->key }}">
                                                            {{ $fuelType->name }}
                                                        </option>
                                                        @endforeach

                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Drive Type</label>
                                                    <select class="form-control" name="drive_type" required>
                                                        <option value="">Choose</option>
                                                        @foreach (getDriveTypes() as $driveType)
                                                        <option value="{{ $driveType->key }}">
                                                            {{ $driveType->name }}
                                                        </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Mileage</label>
                                                    <input type="text" name="mileage" class="form-control" placeholder="Enter mileage" required>
                                                </div>
                                            </div>

                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Engine Size</label>
                                                    <input type="text" name="engine" class="form-control" placeholder="Enter engine size" required>
                                                </div>
                                            </div>

                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Cylenders</label>
                                                    <input type="number" class="form-control" name="cylinders" required>
                                                </div>
                                            </div>

                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label>Color</label>
                                                    <select class="form-control" name="color_id" required>
                                                        <option value="">Choose</option>
                                                        @foreach ($colors as $color)
                                                        <option value="{{ $color->id }}"> {{ $color->name }} </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>

                                            <h6 class="fw-bold mt-4 mb-1">Detailed Information</h6>
                                            <div class="col-lg-12">
                                                <div class="form-group">
                                                    <label>Description</label>
                                                    <textarea class="form-control" name="description" placeholder="Write description" cols="30" rows="5"></textarea>
                                                </div>
                                            </div>
                                            

                                            <h6 class="fw-bold mt-4 mb-1">Main Image</h6>
                                            <div class="col-12">
                                                <input type="file" class="main_image" name="main_image" data-height="100" accept="image/*" />
                                            </div>

                                            <h6 class="fw-bold mt-4 mb-1">Upload Images</h6>
                                            <div class="col-12">
                                                <div class="papers" id="paperHolder">
                                                    <div class="paper addmore">
                                                        <input type="file" class="multi_image_input" name="images[]" accept="image/*" multiple />
                                                        <i class="fa fa-plus"></i>
                                                    </div>
                                                </div>
                                            </div>

                                            <h6 class="fw-bold my-4">Features</h6>
                                            @foreach ($features as $feature)
                                            <p class="text-center">{{$feature->name}} </p>
                                            @foreach ($feature->options as $option)
                                            <div class="col-6 col-md-4">
                                                <div class="form-check">
                                                    <input class="form-check-input" name="features[]" type="checkbox" value="{{ $option->id }}" id="feature{{ $option->id }}">
                                                    <label class="form-check-label" for="feature{{ $option->id }}">
                                                        {{ $option->name }}
                                                    </label>
                                                </div>
                                            </div>
                                            @endforeach
                                            <hr>
                                            @endforeach

                                            <input type="hidden" name="model_id" value="{{ auth('end-user')->user()->id }}">
                                            <input type="hidden" name="model_role" value="user">

                                            <div class="col-12 mt-4">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="" id="agree" required>
                                                    <label class="form-check-label" for="agree">
                                                        I Agree With Your Terms Of Services And Privacy Policy.
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-12 my-4">
                                                <button type="submit" class="theme-btn"><span class="far fa-save"></span> Save & Publish Listing</button>
                                            </div>
                                        </div>
                                    </form>
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

@push('scripts')
<script>
    $('.main_image').dropify({
        messages: {
            'default': "{{ TranslationHelper::translate('main_image','site') }}"
            , 'replace': "{{ TranslationHelper::translate('main_image','site') }}"
        , }
    });

</script>
@include('end-user.pages.profile.scripts')
@endpush
