@extends('admin.layouts.app')

@section('crumb')
<x-bread-crumb :breadcrumbs="[
        ['text'=>'page'],
        ['text'=> 'edit'],
        ]" :button="[]">
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
                        <form action="{{ route('admin.pages.update', $page->id) }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            @method('PUT')
                         
                            <!--begin::Input group-->
                            <div class="fv-row mb-10">
                                <div class="row">

                                    @foreach (Config('language') as $key => $lang)
                                        <div class="col-6 my-3">
                                            <label class="fs-5 fw-bold form-label mb-5">Name in {{ $lang}}:</label>
                                            <!--end::Label-->
                                            <!--begin::Input-->
                                            <input type="text" class="form-control form-control-solid" value="{{ old('name.'.$key) ?? $page->getTranslation('name',$key)}}" placeholder="{{ $lang }}" name="name[{{ $key}}]" />
                                            @error('name.'.$key)
                                            <span class="text-danger" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                            @enderror
                                        </div>
                                    @endforeach

                                    @foreach (Config('language') as $key => $lang)
                                        <div class="col-12 my-3">
                                            <label class="fs-5 fw-bold form-label mb-5">Content in {{ $lang}}:</label>
                                            <!--end::Label-->
                                            <!--begin::Input-->
                                            <textarea name="content[{{$key}}]" id="{{$key}}" class="full-editor" cols="10" rows="5"> {{ old('content.'.$key) ?? $page->getTranslation('content',$key)}} </textarea>
                                            @error('content.'.$key)
                                            <span class="text-danger" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                            @enderror
                                        </div>
                                    @endforeach

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

                                        @if($page->getFirstMediaUrl('pages') != null)
                                        <img src="{{ $page->getFirstMediaUrl('pages') }}" alt="brand" width="200" height="200">
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
