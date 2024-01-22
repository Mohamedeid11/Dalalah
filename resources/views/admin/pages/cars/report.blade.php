@extends('admin.layouts.app')

@section('crumb')
<x-bread-crumb :breadcrumbs="[
        ['text'=>'Car'],
        ['text'=> getLastKeyRoute(request()->route()->getName())]
    ]" :button="[]">
</x-bread-crumb>
@endsection

@section('content')
    {{-- @dd($car->getReportsWithOptions()) --}}
    {{-- @dd($car->reportOptions); --}}

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
                        <form action="{{ route('admin.car.add.report') }}" method="POST" enctype="multipart/form-data">
                            @csrf

                            <div class="row">
                                @foreach ($reports as $report)
                                @if (count($report->options))
                                <h2 class="text-center border p-5"> {{ $report->name }} </h2>
                                <div class="row">
                                @foreach ($report->options as $option)
                                    <div class="col-4">
                                        <div class="row align-items-center">
                                            <div class="col-6">
                                                <input type="checkbox" name="reports[{{$option->id}}][option_id]"
                                                 value="{{ $option->id }}" style="width:20px ; height:20px;"
                                                 {{ in_array($option->id , $car->reportOptions->pluck('id')->toArray()) ?
                                                 'checked' : ''}}>
                                                <label for="" style="font-size: 14px"> {{ $option->name}} </label>
                                            </div>
                                            <div class="col-6 border-end">
                                                {{-- <h3> {{ $option->name }} => Image </h3> --}}
                                                <!--end::Image input placeholder-->
                                                <div class="image-input image-input-empty image-input-outline image-input-placeholder mb-3" data-kt-image-input="true"
                                                style="background: url({{ $car->getImageReport($option->id) }});background-size: cover;" >
                                                    <!--begin::Preview existing avatar-->
                                                    <div class="image-input-wrapper w-100px h-100px"></div>
                                                    <!--end::Preview existing avatar-->
                                                    <!--begin::Label-->
                                                    <label class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow" data-kt-image-input-action="change" data-bs-toggle="tooltip" title="Change avatar">
                                                        <i class="bi bi-pencil-fill fs-7"></i>
                                                        <!--begin::Inputs-->
                                                        <input type="file" name="reports[{{$option->id}}][option_image]" accept=".png, .jpg, .jpeg ,.svg ,.webp" />
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
                                        </div>
                                    </div>
                                @endforeach
                                </div>
                                @endif
                                @endforeach
                                <input type="hidden" name="car_id" value="{{ $car->id }}">
                            </div>

                            <!--begin::Actions-->
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">
                                    <span class="indicator-label">Save</span>
                                </button>
                            </div>
                            <!--end::Actions-->

                        </form>
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
