@extends('admin.layouts.app')

@section('crumb')
<x-bread-crumb :breadcrumbs="[
            ['text'=>'Slider','link'=>route('admin.slider.index')],
            ['text'=> getLastKeyRoute(request()->route()->getName())]
            ]" :button="['text'=>'Go To Slider','link'=>route('admin.slider.index')]">
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
                                        <label class="fs-5 fw-bold form-label mb-5">Title in {{ $lang}}:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <input type="text" class="form-control form-control-solid" value="{{ old('title.'.$key) ?? $slider->getTranslation('title',$key)}}" placeholder="{{ $lang }}" name="title[{{ $key}}]" />
                                        @error('title.'.$key)
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                    @endforeach

                                    <div class="col-6 mt-5">
                                        <label class="fs-5 fw-bold form-label mb-5"> Type :</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <select id="ad_type" name="type" class="form-control form-control-solid">
                                            <option value="{{ $slider->type ?? ' Select Type' }}"> {{ $slider->type ?? 'Select Type'}}</option>
                                        </select>
                                        @error('type')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-6 mt-5" @if(!isset($slider->showroom_id))style="display:none"; @endif id="select_showroom_dev">
                                        <label class="fs-5 fw-bold form-label mb-5"> Showrooms :</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <select id="showroom_select" name="showroom_id" class="form-control form-control-solid">
                                            <option value="{{$slider->showroom_id}}">{{ $slider?->showroom?->name }}</option>
                                        </select>
                                        @error('type')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-6" id="link_dev" @if(!isset($slider->link))style="display:none"; @endif>
                                        <label class="fs-5 fw-bold form-label mb-5 "> Link :</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <input type="text" id="link" class="form-control form-control-solid" value="{{  $slider->link }}" placeholder="{{ $slider->link }}" name="link" />
                                        @error('link')
                                        <span class="text-danger" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                        @enderror
                                    </div>

                                    <div class="col-3 my-3">
                                        <h3> Image </h3>
                                        <!--end::Image input placeholder-->
                                        <div class="image-input image-input-empty image-input-outline image-input-placeholder mb-3" data-kt-image-input="true" style="background: url('{{ $slider->getAvatar() }}');background-size:cover">
                                            <!--begin::Preview existing avatar-->
                                            <div class="image-input-wrapper w-200px h-200px"></div>
                                            <!--end::Preview existing avatar-->
                                            <!--begin::Label-->
                                            <label class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow" data-kt-image-input-action="change" data-bs-toggle="tooltip" title="Change avatar">
                                                <i class="bi bi-pencil-fill fs-7"></i>
                                                <!--begin::Inputs-->
                                                <input type="file" name="image" accept=".png, .jpg, .jpeg ,.svg ,.webp" @if($method != 'PUT') required  @endif />

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
</div>
    @endsection

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const adTypeSelect = document.getElementById('ad_type');
        const adDataInput = document.getElementById('link_dev');
        const linkDataInput = document.getElementById('link');
        const showroomSelect = document.getElementById('showroom_select');
        const showroomDev = document.getElementById('select_showroom_dev');

        // Initialize Select2 for ad type select
        $(adTypeSelect).select2();
        console.log(adTypeSelect.value)
        // Event listener for ad type change
        $('#ad_type').on('change', function(event) {
            const type = event.target.value;
            if (!type) return;
            if(type === 'showroom'){
                showroomDev.style.display = "block"
                linkDataInput.InnerHTML = '';
                adDataInput.style.display = "none"
                axios.post('{{ route('ajax.get.addData') }}', {type: type})
                    .then(function (response) {
                        // console.log(response)
                        const data = response.data;
                        // console.log(data)
                        // console.log(data)
                        let options = '<option value="">Select Data</option>';

                        data.forEach(function (item) {
                            options += `<option value="${item.id}">${item.name}</option>`;
                        });

                        // Set options for ad data select and trigger Select2
                        showroomSelect.innerHTML = options;
                        $(showroomSelect).select2();
                    })
                    .catch(function (error) {
                        console.error('Error fetching ad data:', error);
                    });

            }else {
                showroomDev.style.display = "none"
                showroomSelect.innerHTML = '';
                adDataInput.style.display = "block"
            }
        });

        // Fetch ad types when the page loads
            axios.get('{{route('ajax.get.addTypes')}}')
                .then(function (response) {
                    const types = response.data.types;
                    let options = '<option value="">' + adTypeSelect.value + '</option>';

                    // Iterate through the types and create options
                    Object.keys(types).forEach(function (key) {
                        options += `<option value="${key}">${types[key]}</option>`;
                    });

                    // Set options for ad type select and trigger Select2
                    $('#ad_type').html(options).select2();
                })
                .catch(function (error) {
                    console.error('Error fetching ad types:', error);
                });
    });
</script>
