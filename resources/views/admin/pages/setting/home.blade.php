@extends('admin.layouts.app')

@section('crumb')
<x-bread-crumb :breadcrumbs="[
        ['text'=>'Setting'],
        ['text'=>'Home'],
        ]" :button="[] ">
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
                        <form action="{{ route('admin.setting.update.home') }}" method="POST" enctype="multipart/form-data">
                            @csrf

                            <!--begin::Input group-->
                            <div class="fv-row mb-10">
                                <div class="row">
                                    @include('admin.layouts.form-seprate-sections', ['section' => 'Main Information'])

                                    @foreach (Config('language') as $key => $lang)
                                    <div class="col-6 mt-4">
                                        <label class="fs-5 fw-bold form-label mb-5">Address in {{ $lang}}:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <textarea name="address[{{ $key}}]" class="form-control form-control-solid"> {{ old('address.'.$key) ?? setting('address',$key)}} </textarea>
                                        @error('address.'.$key)
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                    @endforeach

                                    <div class="col-6 mt-4">
                                        <label class="fs-5 fw-bold form-label mb-5">Phone:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <input name="phone[en]" class="form-control form-control-solid" value="{{ old('phone.en') ?? setting('phone','en')}} " />
                                        @error('phone.en')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-6 mt-4">
                                        <label class="fs-5 fw-bold form-label mb-5">E-mail:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <input name="email[en]" class="form-control form-control-solid" value="{{ old('email.en') ?? setting('email','en')}} " />
                                        @error('email.en')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                </div>
                                <!--begin::Label-->
                            </div>
                            <!--end::Input group-->
                            <hr>
                            <!--begin::Input group-->
                            <div class="fv-row mb-10">
                                <div class="row">
                                    @include('admin.layouts.form-seprate-sections', ['section' => 'About Section Information'])


                                    @foreach (Config('language') as $key => $lang)
                                    <div class="col-6 mt-4">
                                        <label class="fs-5 fw-bold form-label mb-5">About Section Title in {{ $lang}}:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <textarea name="about_section_title[{{ $key}}]" class="form-control form-control-solid"> {{ old('about_section_title.'.$key) ?? setting('about_section_title',$key)}} </textarea>
                                        @error('about_section_title.'.$key)
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                    @endforeach


                                    @foreach (Config('language') as $key => $lang)
                                    <div class="col-6 mt-4">
                                        <label class="fs-5 fw-bold form-label mb-5">About Section Content in {{ $lang}}:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <textarea name="about_section_content[{{ $key}}]" rows="6" class="form-control form-control-solid"> {{ old('about_section_content.'.$key) ?? setting('about_section_content',$key)}} </textarea>
                                        @error('about_section_content.'.$key)
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                    @endforeach

                                    <div class="col-6 mt-4">
                                        <!--begin::Label-->
                                        <label class="fs-5 fw-bold form-label mb-5">About Image: <span class="text-danger"> Recommend Size 600 x 500</span></label>
                                        <!--end::Label-->
                                        <input type="file" class="form-control form-control-solid" name="about_section_img" />
                                        @if(setting('about_section_img','en') != null)
                                        <img src="{{ setting('about_section_img','en') }}" alt="slider-about_section_img" width="200" height="200">
                                        @endif
                                    </div>

                                </div>
                                <!--begin::Label-->
                            </div>
                            <!--end::Input group-->

                            <hr>
                            <!--begin::Input group-->
                            <div class="fv-row mb-10">
                                <div class="row">
                                    @include('admin.layouts.form-seprate-sections', ['section' => 'Download App Section'])


                                    @foreach (Config('language') as $key => $lang)
                                    <div class="col-6 mt-4">
                                        <label class="fs-5 fw-bold form-label mb-5">show Section Title in {{ $lang}}:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <textarea name="show_section_title[{{ $key}}]" class="form-control form-control-solid"> {{ old('show_section_title.'.$key) ?? setting('show_section_title',$key)}} </textarea>
                                        @error('show_section_title.'.$key)
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                    @endforeach


                                    @foreach (Config('language') as $key => $lang)
                                    <div class="col-6 mt-4">
                                        <label class="fs-5 fw-bold form-label mb-5">show Section Content in {{ $lang}}:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <textarea name="show_section_content[{{ $key}}]" rows="6" class="form-control form-control-solid"> {{ old('show_section_content.'.$key) ?? setting('show_section_content',$key)}} </textarea>
                                        @error('show_section_content.'.$key)
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                    @endforeach

                                    <div class="col-6 mt-4">
                                        <label class="fs-5 fw-bold form-label mb-5">App Store Link:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <input name="download_appstore[en]" class="form-control form-control-solid" value="{{ old('download_appstore.en') ?? setting('download_appstore','en')}} " />
                                        @error('download_appstore.en')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-6 mt-4">
                                        <label class="fs-5 fw-bold form-label mb-5">Play Store Link:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <input name="download_playstore[en]" class="form-control form-control-solid" value="{{ old('download_playstore.en') ?? setting('download_playstore','en')}} " />
                                        @error('download_playstore.en')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-6 mt-4">
                                        <!--begin::Label-->
                                        <label class="fs-5 fw-bold form-label mb-5">Download Image: <span class="text-danger"> Recommend Size 600 x 500</span></label>
                                        <!--end::Label-->
                                        <input type="file" class="form-control form-control-solid" name="show_section_img" />
                                        @if(setting('show_section_img','en') != null)
                                        <img src="{{ setting('show_section_img','en') }}" alt="slider-about_section_img" width="200" height="200">
                                        @endif
                                    </div>

                                </div>
                                <!--begin::Label-->
                            </div>
                            <!--end::Input group-->

                            <hr>
                            <!--begin::Row-->

                            @include('admin.layouts.form-seprate-sections', ['section' => 'Site Logo'])

                            <div class="col-6 mt-4">
                                <!--begin::Label-->
                                <label class="fs-5 fw-bold form-label mb-5">Logo: <span class="text-danger"> Recommend Size 230 x 230</span></label>
                                <!--end::Label-->
                                <input type="file" class="form-control form-control-solid" name="site_logo" />
                                @if(setting('site_logo','en') != null)
                                <img src="{{ setting('site_logo','en') }}" alt="slider-site_logo" width="200" height=200">
                                @endif
                            </div>

                            <hr>

                            @include('admin.layouts.form-seprate-sections', ['section' => 'Payment Status'])

                            <div class="col-6 mt-4">
                                <label class="fs-5 fw-bold form-label mb-5"> Display Or hide payment </label>

                                <label class="form-check form-switch form-check-custom form-check-solid">
                                    <input type="checkbox" onchange="changeStatus('{{route('admin.payment.status')}}')" class="form-check-input" name="show_payment" @if (setting('show_payment','en')) checked @endif>
                                </label>

                            </div>

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
            function changeStatus(url) {
                $.ajax({
                    url: url
                    , data: ''
                    , type: 'GET'
                    , beforeSend: function() {
                        $('.overlay-body-loader').css('display', 'flex');
                    }
                    , success: function(res) {
                        location.reload();
                    }
                    , complete: function(data) {
                        $('.overlay-body-loader').css('display', 'none');
                    }
                });
            }
        </script>
@endpush
