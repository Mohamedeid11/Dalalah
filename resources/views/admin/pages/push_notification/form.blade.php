@extends('admin.layouts.app')

@section('crumb')
    <x-bread-crumb :breadcrumbs="[
            ['text'=>'Push Notification','link'=>route('admin.push_notification.index')],
            ['text'=> getLastKeyRoute(request()->route()->getName())]
            ]" :button="['text'=>'Go To All Notification','link'=>route('admin.push_notification.index')]">
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

                                    <div class="col-6">
                                        <label class="fs-5 fw-bold form-label mb-5">Title:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <input type="text" class="form-control form-control-solid" value="{{ old('title')}} " placeholder="Title" name="title" />
                                        @error('title')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-6">
                                        <label class="fs-5 fw-bold form-label mb-5"> Clients :</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <select name="clients" class="form-control form-control-solid">
                                            <option value="all">all</option>
                                            <option value="users">Users</option>
                                            <option value="showrooms">Showrooms</option>
                                            <option value="agencies">Agencies</option>
                                            <option value="new_cars">New Car Ad</option>
                                            <option value="used_cars">Used Car Ad</option>
                                        </select>
                                        @error('clients')
                                            <span class="text-danger" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>

                                    <div class="col-12">
                                        <label class="fs-5 fw-bold form-label mb-5">Message:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <textarea name="message" class="form-control" cols="5" rows="5"></textarea>
                                        @error('message')
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
                                    <span class="indicator-label">Send</span>
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
