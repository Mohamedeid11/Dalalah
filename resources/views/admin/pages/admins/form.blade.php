@extends('admin.layouts.app')

@section('crumb')
<x-bread-crumb :breadcrumbs="[
        ['text'=>'Admins','link'=>route('admin.admin.index')],
        ['text'=> getLastKeyRoute(request()->route()->getName())]
        ]" :button="['text'=>'Go To Admins','link'=>route('admin.admin.index')]">
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
                                        <label class="fs-5 fw-bold form-label mb-5">Name :</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <input type="text" class="form-control form-control-solid" value="{{ old('name') ?? $admin->name}}" placeholder="name" name="name" />
                                        @error('name')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-6">
                                        <label class="fs-5 fw-bold form-label mb-5">Email :</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <input type="email" class="form-control form-control-solid" value="{{ old('email') ?? $admin->email}}" placeholder="email" name="email" />
                                        @error('email')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-6 mt-5">
                                        <label class="fs-5 fw-bold form-label mb-5">Password :</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <input type="password" class="form-control form-control-solid" placeholder="password" name="password" />
                                        @error('password')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-6 mt-5">
                                        <label class="fs-5 fw-bold form-label mb-5">Role:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <select name="role" class="form-control form-control-solid">
                                            <option value="">---</option>
                                            @foreach ($roles as $role)
                                                <option value="{{ $role->id }}" {{ in_array($role->id  , $admin->roles->pluck('id')->toArray() )  ? 'selected' : ''}}>{{ $role->name }}</option>
                                            @endforeach
                                        </select>
                                        @error('type')
                                            <span class="text-danger" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <!--end::Input group-->

                            <!--begin::Actions-->
                            <div class="text-center mt-4">
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
