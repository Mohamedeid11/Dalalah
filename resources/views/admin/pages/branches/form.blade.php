@extends('admin.layouts.app')

@section('crumb')
<x-bread-crumb :breadcrumbs="[
        ['text'=> $showroom->showroom_name],
        ['text'=>'branches','link'=>route('admin.branch.index',['showroom'=>$showroom->id])],
        ['text'=> getLastKeyRoute(request()->route()->getName())]
        ]" :button="['text'=>'Go To branches','link'=>route('admin.branch.index',['showroom'=>$showroom->id])]">
</x-bread-crumb>
@endsection

@section('content')

<!--begin::Content-->
<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
    <!--begin::Post-->
    <div class="post d-flex flex-column-fluid" id="kt_post">
        <!--begin::Container-->
        <div id="kt_content_container" class="container-xxl">
            <!--begin::Card-->
            <div class="card">
                <!--begin::Card header-->
                <div class="card-header border-0 pt-6">

                    <!--begin::Card body-->

                    <div class="card-body pt-0">
                        <!--begin::Form-->
                        <form action="{{ $action }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            @if($method == 'PUT')
                            @method('PUT')
                            @endif
                            <!--begin::Input group-->
                            <div class="fv-row mb-10">
                                <div class="row">

                                    @foreach (Config('language') as $key => $lang)
                                    <div class="col-6 my-3">
                                        <label class="fs-5 fw-bold form-label mb-5">Name in {{ $lang}}:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <input type="text" class="form-control form-control-solid" value="{{ old('name.'.$key) ?? $branch->getTranslation('name',$key)}}" placeholder="{{ $lang }}" name="name[{{ $key}}]" />
                                        @error('name.'.$key)
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                    @endforeach

                                    @foreach (Config('language') as $key => $lang)
                                    <div class="col-6 my-3">
                                        <label class="fs-5 fw-bold form-label mb-5">Address in {{ $lang}}:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <textarea name="address[{{$key}}]" class="form-control form-control-solid" cols="10" rows="5"> {{ old('address.'.$key) ?? $branch->getTranslation('address',$key)}} </textarea>
                                        @error('address.'.$key)
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                    @endforeach

                                    <div class="col-6 mt-5">
                                        <label class="fs-5 fw-bold form-label mb-5">cities:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <select name="city_id" id="city_id" class="form-control form-control-solid">
                                            <option value="">---</option>
                                            @foreach ($cities as $city)
                                            <option value="{{ $city->id }}" {{ $city->id == $branch->city_id ? 'selected' : ''}}>{{ $city->name }}</option>
                                            @endforeach
                                        </select>
                                        @error('city_id')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-6 mt-5">
                                        <label class="fs-5 fw-bold form-label mb-5">districts:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <select name="district_id" id="district_id" class="form-control form-control-solid">
                                        </select>
                                        @error('district_id')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-6 mt-5">
                                        <label class="fs-5 fw-bold form-label mb-5">Phone:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <input type="tel" class="form-control form-control-solid" value="{{ old('phone') ?? $branch->phone }}" placeholder="phone" name="phone" />
                                        @error('phone')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-6 mt-5">
                                        <label class="fs-5 fw-bold form-label my-3">Link Map:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <input type="text" class="form-control form-control-solid" value="{{ old('link') ?? $branch->link }}" placeholder="link map" name="link" />
                                        @error('link')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                    <input type="hidden" name="showroom_id" value="{{ $showroom->id }}">

                                    <div class="col-12 my-3">
                                        <!--begin::Label-->
                                        <label class="fs-5 fw-bold form-label mb-5">Image:</label>
                                        <!--end::Label-->
                                        <input type="file" class="form-control form-control-solid" name="image" />
                                        @error('image')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror

                                        @if($branch->getFirstMediaUrl('branches') != null)
                                        <img src="{{ $branch->getFirstMediaUrl('branches') }}" alt="brand" width="200" height="200">
                                        @endif
                                    </div>


                                </div>
                                <!--begin::Label-->
                            </div>
                            <!--end::Input group-->

                            <!--begin::Actions-->
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">
                                    <span class="indicator-label">Save</span>
                                </button>
                            </div>
                            <!--end::Actions-->

                        </form>
                        <!--end::Form-->
                    </div>
                    <!--end::Card body-->
                </div>
                <!--end::Card-->
            </div>
            <!--end::Container-->
        </div>
        <!--end::Post-->
    </div>
    <!--end::Content-->

    @endsection

    @push('admin_js')
    <script>
        $('#years-dropdown').select2({
            'placeholder': 'choose years*'
        });
        // The DOM element you wish to replace with Tagify
        var input = document.querySelector('input[name=extensions]');
        // initialize Tagify on the above input node reference
        new Tagify(input);

    </script>

    <script>

        let city = @json(old('city_id', $branch->city_id));

        $('#city_id').on('change', function() {
            let cityId = this.value;
            console.log(cityId);
            getCity(cityId);
        });

        $(function() {
            getCity($('#city_id').val());
        })

        function getCity(cityId) {
            if (cityId) {
                $.ajax({
                    url: "{{ route('admin.get-districts') }}"
                    , type: "GET"
                    , data: {
                        "_token": "{{ csrf_token() }}"
                        , value: cityId
                    , }
                    , dataType: "json"
                    , success: function(data) {
                        if (data) {
                            $('#district_id').empty();
                            $('#district_id').focus;
                            $('#district_id').append('<option value="" disabled selected>-- Select District --</option>');
                            let array = data.data;
                            array.forEach(myFunction);

                            function myFunction(item, index) {
                                checkCityId = cityId == item.id ? true : false;
                                select = `<option value="${item.id}" ${checkCityId ? 'selected' :''}>${item.name.en}</option>`;
                                $('#district_id').append(select);
                            }
                           
                        }
                    }
                });

            } else {
                $('#district_id').empty();
            }
        }


    </script>
    @endpush
