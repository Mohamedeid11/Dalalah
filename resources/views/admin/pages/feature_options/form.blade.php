@extends('admin.layouts.app')

@section('crumb')
<x-bread-crumb :breadcrumbs="[
        ['text'=> $feature->name],
        ['text'=>'Features','link'=>route('admin.feature_option.index',['feature'=>$feature->id])],
        ['text'=> getLastKeyRoute(request()->route()->getName())]
        ]" :button="['text'=>'Go To Feature Option','link'=>route('admin.feature_option.index',['feature'=>$feature->id])]">
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
                                        <input type="text" class="form-control form-control-solid" value="{{ old('name.'.$key) ?? $featureOption->getTranslation('name',$key)}}" placeholder="{{ $lang }}" name="name[{{ $key}}]" />
                                        @error('name.'.$key)
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                    @endforeach

                                                 <div class="col-3 my-3">
                                        <h3> Icon </h3>
                                        <!--end::Image input placeholder-->
                                        <div class="image-input image-input-empty image-input-outline image-input-placeholder mb-3" data-kt-image-input="true" style="background: url('{{ $featureOption->getIcon() }}');background-size:cover">
                                            <!--begin::Preview existing avatar-->
                                            <div class="image-input-wrapper w-200px h-200px"></div>
                                            <!--end::Preview existing avatar-->
                                            <!--begin::Label-->
                                            <label class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow" data-kt-image-input-action="change" data-bs-toggle="tooltip" title="Change avatar">
                                                <i class="bi bi-pencil-fill fs-7"></i>
                                                <!--begin::Inputs-->
                                                <input type="file" name="icon" accept=".png, .jpg, .jpeg ,.svg ,.webp"   @if($method != 'PUT')  required  @endif />

                                                {{-- <input type="hidden" name="avatar_remove" /> --}}
                                                <!--end::Inputs-->
                                            </label>
                                            <!--end::Label-->
                                            <!--begin::Cancel-->
                                            <span class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow" data-kt-image-input-action="cancel" data-bs-toggle="tooltip" title="Cancel avatar">
                                                <i class="bi bi-x fs-2"></i>
                                            </span>
                                            <!--end::Cancel-->
                                            <!--begin::Remove-->
                                            <span class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow" data-kt-image-input-action="remove" data-bs-toggle="tooltip" title="Remove avatar">
                                                <i class="bi bi-x fs-2"></i>
                                            </span>
                                            <!--end::Remove-->
                                        </div>
                                        <!--end::Image input-->
                                    </div>

                                    <input type="hidden" name="feature_id" value="{{ $feature->id }}">

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
