@extends('admin.layouts.app')

@section('crumb')
<x-bread-crumb :breadcrumbs="[
        ['text'=>'Setting'],
        ['text'=>'Feature'],
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
                        <form action="{{ route('admin.setting.update.feature') }}" method="POST" enctype="multipart/form-data">
                            @csrf

                            <!--begin::Input group-->
                            <div class="fv-row mb-10">
                                <div class="row">
                                    @include('admin.layouts.form-seprate-sections', ['section' => 'Feature Settings'])

                                    <div class="col-4 mt-4">
                                        <label class="fs-5 fw-bold form-label mb-5">Basic Duration <span style="color: #0b5ed7">(days)</span>:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <input type="number" name="feature_basic_duration[en]" class="form-control form-control-solid" value="{{ old('feature_basic_duration.en') ?? setting('feature_basic_duration','en')}}" />
                                        @error('feature_basic_duration.en')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-4 mt-4">
                                        <label class="fs-5 fw-bold form-label mb-5">Feature Duration <span style="color: #0b5ed7">(days)</span>:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <input type="number" name="feature_duration[en]" class="form-control form-control-solid" value="{{ old('feature_duration.en') ?? setting('feature_duration','en')}}" />
                                        @error('twitter.en')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-4 mt-4">
                                        <label class="fs-5 fw-bold form-label mb-5">Feature Duration Price <span style="color: green">(SAR)</span>:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <input type="number" name="feature_duration_price[en]" class="form-control form-control-solid" value="{{ old('feature_duration_price.en') ?? setting('feature_duration_price','en')}}" />
                                        @error('linkedin.en')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
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
