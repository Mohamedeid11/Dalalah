@extends('end-user.layouts.app')

@section('content')
<main class="main">

    <!-- breadcrumb -->
    <div class="site-breadcrumb" style="background: url('{{ asset('end-user/assets/img/breadcrumb/01.png')}}')">
        <div class="container">
            <h2 class="breadcrumb-title">branch</h2>
            <ul class="breadcrumb-menu">
                <li><a href="{{ route('end-user.index') }}">Home</a></li>
                <li class="active">branch</li>
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
                                    <h4 class="user-profile-card-title">Create branch</h4>
                                    <div class="user-profile-form">
                                        <form action="{{ route('showroom.profile.store.branch') }}" method="POST" enctype="multipart/form-data">
                                            @csrf

                                            <div class="row">

                                                @foreach (Config('language') as $key => $lang)
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Name in {{ $lang}} </label>
                                                        <input type="text" class="form-control" value="{{ old('name.'.$key) }}" placeholder="{{ $lang }}" name="name[{{ $key}}]" required>
                                                        @error('name.'.$key)
                                                        <span class="text-danger" role="alert">
                                                            <strong>{{ $message }}</strong>
                                                        </span>
                                                        @enderror
                                                    </div>
                                                </div>
                                                @endforeach

                                                @foreach (Config('language') as $key => $lang)
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Address in {{ $lang}}:</label>
                                                        <!--end::Label-->
                                                        <!--begin::Input-->
                                                        <textarea name="address[{{$key}}]" class="form-control " cols="5" rows="5" required> {{ old('address.'.$key) }} </textarea>
                                                        @error('address.'.$key)
                                                        <span class="text-danger" role="alert">
                                                            <strong>{{ $message }}</strong>
                                                        </span>
                                                        @enderror
                                                    </div>
                                                </div>
                                                @endforeach

                                                <div class="col-lg-6">
                                                    <div class="form-group">
                                                        <label>City</label>
                                                        <select name="city_id" id="city" class="form-control" required>
                                                            <option value="">Choose City</option>
                                                            @foreach ($cities as $city)
                                                            <option value="{{ $city->id }}">
                                                                {{ $city->name }}
                                                            </option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-lg-6">
                                                    <div class="form-group">
                                                        <label>District</label>
                                                        <select name="district_id" id="district" class="form-control" required>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Phone</label>
                                                        <input type="number" class="form-control" name="phone" value="{{ old('phone') }}" required placeholder="Phone">
                                                        @error('phone')
                                                        <span class="text-danger" role="alert">
                                                            <strong>{{ $message }}</strong>
                                                        </span>
                                                        @enderror
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>link map</label>
                                                        <input type="text" class="form-control" name="link" value="{{ old('link') }}" placeholder="link map" required>
                                                        @error('link')
                                                        <span class="text-danger" role="alert">
                                                            <strong>{{ $message }}</strong>
                                                        </span>
                                                        @enderror
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label>Logo</label>
                                                        <input type="file" class="form-control" name="image" required>
                                                        @error('image')
                                                        <span class="text-danger" role="alert">
                                                            <strong>{{ $message }}</strong>
                                                        </span>
                                                        @enderror
                                                    </div>
                                                </div>
                                                <input type="hidden" name="showroom_id" value="{{ auth('showroom')->user()->id }}">
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

@push('scripts')
<script>
    let district = @json(old('district_id'));

    $('#city').on('change', function() {
        let $cityId = this.value;
        getDestricts($cityId);
    });

    $(function() {
        getDestricts($('#city').val());
    });

    function getDestricts($cityId) {
        if ($cityId) {
            $.ajax({
                url: "{{ route('ajax.get.districts') }}"
                , type: "GET"
                , data: {
                    "_token": "{{ csrf_token() }}"
                    , value: $cityId
                , }
                , dataType: "json"
                , success: function(data) {
                    if (data) {
                        $('#district').empty();
                        $('#district').focus;
                        $('#district').append('<option value="" disabled selected>-- Select Destrict --</option>');
                        let array = data.data;
                        array.forEach(myFunction);

                        function myFunction(item, index) {
                            checkDistrict = district == item.id ? true : false;
                            select = `<option value="${item.id}" ${checkDistrict ? 'selected' :''}>${item.name.en}</option>`;
                            $('#district').append(select);
                        }
                    }
                }
            });
        } else {
            $('#district').empty();
        }
    }

</script>
@endpush
