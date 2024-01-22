@extends('end-user.layouts.app')

@push('styles')
<link rel="stylesheet" href="{{ asset('end-user/assets/css/form-steps.css') }}">
@endpush

@section('content')

<main class="main">

    <!-- breadcrumb -->
    <div class="site-breadcrumb" style="background: url('{{asset('end-user/assets/img/breadcrumb/01.png')}}')">
        <div class="container">
            <h2 class="breadcrumb-title"> {{TranslationHelper::translate('sell_tradein_your_car' ,'site' )}} </h2>
            <ul class="breadcrumb-menu">
                <li><a href="{{  route('end-user.index') }}">{{TranslationHelper::translate('home' ,'site' )}}</a></li>
                <li class="active">{{TranslationHelper::translate('sell_tradein_your_car' ,'site' )}}</li>
            </ul>
        </div>
    </div>
    <!-- breadcrumb end -->

    <div class="container">
        <div class="wrapper custom-sell-form">

            <div class="header">
                <ul class="custom-header-sell-form">
                    <li class="active form_1_progessbar">
                        <div>
                            <p>1</p>
                        </div>
                    </li>
                    <li class="form_2_progessbar">
                        <div>
                            <p>2</p>
                        </div>
                    </li>
                </ul>
            </div>

            <form action="{{ route('end-user.request.store') }}" method="POST" class="form-control custom-div-sell-form" id="sell-form">
                @csrf

                <div class="form_wrap" >

                    <div class="form_1 data_info">
                        <h2> {{TranslationHelper::translate('sell_tradein_your_car' ,'site' )}} </h2>

                        <div class="form_container">

                            <div class="form-group">
                                <label> {{TranslationHelper::translate('brand' ,'site' )}}  </label>
                                <select name="brand_id" id="brand" class="form-control">
                                    <option value="" disabled selected> {{TranslationHelper::translate('select_brand' ,'site' )}} </option>
                                    @foreach ($brands as $brand)
                                    <option value="{{ $brand->id }}">{{ $brand->name }}</option>
                                    @endforeach
                                </select>
                                <span class="text-danger clear brand"></span>
                            </div>

                            <div class="form-group">
                                <label>{{TranslationHelper::translate('model' ,'site' )}}</label>
                                <select name="car_model_id" id="model" class="form-control"></select>
                                <span class="text-danger clear model"></span>
                            </div>

                            <div class="form-group">
                                <label>{{TranslationHelper::translate('extension' ,'site' )}} </label>
                                <select name="car_model_extension_id" id="extension" class="form-control"></select>
                                <span class="text-danger clear extension"></span>
                            </div>

                            <div class="form-group">
                                <label>{{TranslationHelper::translate('year_of_make' ,'site' )}}</label>
                                <select name="year" id="year" class="form-control">
                                    @foreach ($years as $year)
                                    <option value="{{ $year }}">{{ $year }}</option>
                                    @endforeach
                                </select>
                                <span class="text-danger clear year"></span>
                            </div>

                            <div class="form-group">
                                <label>{{TranslationHelper::translate('odometer' ,'site' )}}</label>
                                <input type="text" name="mileage" id="mileage" class="form-control">
                                <span class="text-danger clear mileage"></span>
                            </div>

                            <div class="form-group">
                                <label>{{TranslationHelper::translate('city' ,'site' )}}</label>
                                <select name="city_id" id="city" class="form-control">
                                    @foreach ($cities as $city)
                                    <option value="{{ $city->id }}">{{ $city->name }}</option>
                                    @endforeach
                                </select>
                                <span class="text-danger clear city"></span>
                            </div>

                        </div>
                    </div>

                    <div class="form_2 data_info" style="display: none;">
                        <h2>{{TranslationHelper::translate('personal_info' ,'site' )}}</h2>
                        <div class="form_container">

                            <div class="form-group">
                                <label> {{TranslationHelper::translate('full_name','site')}} </label>
                                <input type="text" name="name" id="name" class="form-control" placeholder="{{TranslationHelper::translate('full_name' ,'site' )}}">
                                <span class="text-danger clear name"></span>
                            </div>

                            <div class="form-group">
                                <label>{{TranslationHelper::translate('mobile_number' ,'site' )}}</label>
                                <input type="tel" name="phone" id="phone" class="form-control" placeholder="{{TranslationHelper::translate('mobile_number' ,'site' )}}">
                                <span class="text-danger clear phone"></span>
                            </div>

                        </div>
                    </div>

                </div>

                <div class="btns_wrap">
                    <div class="common_btns form_1_btns">
                        <button type="button" class="btn_next"> {{TranslationHelper::translate('next' ,'site' )}} <span class="icon">
                                <ion-icon name="arrow-forward-sharp"></ion-icon>
                            </span></button>
                    </div>
                    <div class="common_btns form_2_btns" style="display: none;">
                        <button type="button" style="display: none" class="btn_back"><span class="icon">
                                <ion-icon name="arrow-back-sharp"></ion-icon>
                            </span>{{TranslationHelper::translate('back' ,'site' )}}</button>
                        <button type="button" id="btn-done" class="btn_done">{{TranslationHelper::translate('done' ,'site' )}}</button>
                    </div>
                </div>
            </form>

        </div>
    </div>

</main>

@endsection

@push('scripts')

    <script>
        $('#brand').on('change', function() {
            let $brandId = this.value;
            getModels($brandId);
        });

        $('#model').on('change', function() {
            let modelId = this.value;
            getExtensions(modelId);
        });

        function getModels(brandId) {
            if (brandId) {
                $.ajax({
                    url: "{{ route('ajax.get.models') }}"
                    , type: "GET"
                    , data: {
                        "_token": "{{ csrf_token() }}"
                        , value: brandId
                    , }
                    , dataType: "json"
                    , success: function(data) {
                        if (data) {
                            $('#model').empty();
                            $('#model').focus;
                            $('#model').append('<option value="" disabled selected>-- Select Model --</option>');
                            let array = data.data;
                            array.forEach(myFunction);

                            function myFunction(item, index) {
                                select = `<option value="${item.id}" >${item.name.en}</option>`;
                                $('#model').append(select);
                            }
                            // getExtensions($('#model').val());
                            $('#extension').empty();
                        }
                    }
                });
            } else {
                $('#model').empty();

            }
        }

        function getExtensions(modelId) {
            if (modelId) {
                $.ajax({
                    url: "{{ route('ajax.get.extension') }}"
                    , type: "GET"
                    , data: {
                        "_token": "{{ csrf_token() }}"
                        , value: modelId
                    , }
                    , dataType: "json"
                    , success: function(data) {
                        console.log(data)
                        if (data) {
                            $('#extension').empty();
                            $('#extension').focus;
                            $('#extension').append('<option value="" disabled selected>-- {{ TranslationHelper::translate('Select Extension' ,'site' ) }} --</option>');
                            let array = data.data;
                            array.forEach(myFunction);

                            function myFunction(item, index) {
                                select = `<option value="${item.id}">${item.name}</option>`;
                                $('#extension').append(select);
                            }
                        }
                    }
                });
            } else {
                $('#extension').empty();
            }
        }
    </script>

    <script>
        var form_1 = document.querySelector(".form_1");
        var form_2 = document.querySelector(".form_2");
        var form_1_btns = document.querySelector(".form_1_btns");
        var form_2_btns = document.querySelector(".form_2_btns");
        var form_1_next_btn = document.querySelector(".form_1_btns .btn_next");
        var form_2_back_btn = document.querySelector(".form_2_btns .btn_back");
        var form_2_next_btn = document.querySelector(".form_2_btns .btn_next");
        var form_2_progessbar = document.querySelector(".form_2_progessbar");
        var btn_done = document.querySelector(".btn_done");
        var modal_wrapper = document.querySelector(".modal_wrapper");
        var shadow = document.querySelector(".shadow");

        form_1_next_btn.addEventListener("click", function() {

            $('.clear').text(' ');
            let validate = false

            if ($('#brand').val() == null) {
                $('.brand').text('brand required');
                $('#brand').focus();
                return validate;
            } else if ($('#model').val() == null) {
                $('.model').text('model required');
                $('#model').focus();
                return validate;
            } else if ($('#extension').val() == null) {
                $('.extension').text('extension required');
                $('#extension').focus();
                return validate;
            } else if ($('#year').val() == null) {
                $('.year').text('year required');
                $('#year').focus();
                return validate;
            } else if ($('#mileage').val() == '') {
                $('.mileage').text('mileage required');
                $('#mileage').focus();
                return validate;
            } else if ($('#city').val() == null) {
                $('.city').text('city required');
                $('#city').focus();
                return validate;
            } else {
                $('.clear').text(' ');
                validate = true;
            }

            if (validate) {
                form_1.style.display = "none";
                form_2.style.display = "block";
                //////////////
                form_1_btns.style.display = "none";
                form_2_btns.style.display = "flex";
                //////////
                form_2_progessbar.classList.add("active");
            }

        });

        btn_done.addEventListener("click", function() {

            $('.clear').text(' ');
            let validate = false;
            if ($('#name').val() == '') {
                $('.name').text('name required');
                $('#name').focus();
                return validate;
            } else if ($('#phone').val() == '') {
                $('.phone').text('phone required');
                $('#phone').focus();
                return validate;
            } else {
                $('.clear').text(' ');
                $('#btn-done').prop('disabled', true);  
                validate = true;
            }

            if (validate) {
                sendAjaxRequest();
            }

        });

        function sendAjaxRequest() {
        
            const action = $('#sell-form').attr("action");
            let formData = new FormData($('#sell-form')[0]);

            $.ajax({
                url: action
                , data: formData
                , type: 'POST'
                , processData: false
                , contentType: false
                , cache: false
                , beforeSend: function() {
                    //
                }
                , success: function(res) {
                    location.reload();
                }
                , complete: function(data) {
                    //
                }
                , error: function(reject) {
                    // let res = $.parseJSON(reject.responseText);
                    // console.log(res.errors);
                    // $.each(res.errors, function(key, value) {
                    //     $("#" + key).text(value[0]);
                    // });
                }
            });

        }
    </script>

@endpush
