@extends('admin.layouts.app')

@section('crumb')
<x-bread-crumb :breadcrumbs="[
        ['text'=>'Roles','link'=>route('admin.role.index')],
        ['text'=> getLastKeyRoute(request()->route()->getName())]
        ]" :button="['text'=>'Go To Roles','link'=>route('admin.role.index')]">
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

                                    <div class="col-6 mb-5">
                                        <label class="fs-5 fw-bold form-label mb-5">Role Name :</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <input type="text" class="form-control form-control-solid" value="{{ old('name') ?? $role->name}}" placeholder="name" name="name" />
                                        @error('name')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-6 my-auto mx-auto text-center">
                                        {{-- <label class="fs-5 fw-bold form-label">.</label> --}}
                                        <input type="checkbox" id="all_checked" class="form-check-input" onclick="checkAllPermission()">
                                        all permission
                                    </div>

                                    @foreach($permissions as $key => $permission)
                                    <div class="col-2">
                                        <input type="checkbox" id="{{ $key }}" class="form-check-input all_checked" onclick="sendNameOfPermission('{{ $key }}')">
                                        <span>
                                            <h4 class="d-inline-block"> {{ $key }} </h4>
                                        </span>
                                    </div>
                                    <div class="col-10">
                                        <div class="row">
                                            @foreach ($permission as $item)
                                            <div class="col-1"></div>
                                            <div class="col-1 mt-3">
                                                <input type="checkbox" class="form-check-input {{ $key }} all_checked" name="permissions[{{ $item['id'] }}]" value="{{ $item['id'] }}" @if(is_array(old('permissions')) && in_array($item['id'] , old('permissions'))) checked @endif {{ in_array($item['id']  , $selectedPermissions)  ? 'checked' : ''}} />
                                            </div>
                                            <div class="col-1 mt-3">
                                                <label class="fs-5 fw-bold form-label mb-5">{{ $item['name'] }}</label>
                                            </div>
                                            @endforeach
                                        </div>
                                    </div>
                                    <hr>
                                    @endforeach

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
</div>

    @endsection

    @push('admin_js')

    <script>
        
        function sendNameOfPermission(name) {

            $('#' + name).change(function() {
                if ($(this).is(":checked")) {
                    $('.' + name).prop('checked', true);
                } else {
                    $('.' + name).prop('checked', false);
                }
            });

            $("." + name).change(function() {
                if ($('.' + name + ':checked').length == $("." + name).length) {
                    $('#' + name).prop('checked', true);
                } else {
                    $('#' + name).prop('checked', false);
                }
            });

        }

        function checkAllPermission() {
            $('#all_checked').change(function() {
                if ($(this).is(":checked")) {
                    $('.all_checked').prop('checked', true);
                } else {
                    $('.all_checked').prop('checked', false);
                }
            });
        }

        $(".all_checked").change(function() {
            if ($('.all_checked:checked').length == $('.all_checked').length) {
                $('#all_checked').prop('checked', true);
            } else if ($('.all_checked:checked').length == $('.all_checked').length - 1) {
                $('#all_checked').prop('checked', true);
            } else {
                $('#all_checked').prop('checked', false);
            }
        });

    </script>

    @endpush
