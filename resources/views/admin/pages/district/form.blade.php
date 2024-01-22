@extends('admin.layouts.app')

@section('crumb')
    <x-bread-crumb :breadcrumbs="[
        ['text'=>'Districts','link'=>route('admin.district.index')],
        ['text'=> getLastKeyRoute(request()->route()->getName())]
        ]" :button="['text'=>'Go To Districts','link'=>route('admin.district.index')]">
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
                                        <div class="col-6">
                                            <label class="fs-5 fw-bold form-label mb-5">Name in {{ $lang}}:</label>
                                            <!--end::Label-->
                                            <!--begin::Input-->
                                            <input type="text" class="form-control form-control-solid" value="{{ old('name.'.$key) ?? $district->getTranslation('name',$key)}}" placeholder="{{ $lang }}" name="name[{{ $key}}]" />
                                            @error('name.'.$key)
                                            <span class="text-danger" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                            @enderror
                                        </div>
                                    @endforeach

                                    <div class="col-6 mt-5">
                                        <label class="fs-5 fw-bold form-label mb-5">Cities:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <select name="city_id" class="form-control form-control-solid">
                                            <option value="">---</option>
                                            @foreach ($cities as $city)
                                                <option value="{{ $city->id }}" {{ $city->id == $district->city_id ? 'selected' : ''}}>{{ $city->name }}</option>
                                            @endforeach
                                        </select>
                                        @error('city_id')
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
