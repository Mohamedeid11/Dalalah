@extends('admin.layouts.app')

@section('crumb')
<x-bread-crumb :breadcrumbs="[
    ['text'=>'Cars','link'=>route('admin.car.index')],
    ['text'=> getLastKeyRoute(request()->route()->getName())]
    ]" :button="['text'=>'Go To Cars','link'=>route('admin.car.index')]">
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
                        <form action="{{ $action }}" method="POST" enctype="multipart/form-data" id="add_car">
                            @csrf
                            @if($method == 'PUT')
                                @method('PUT')
                            @endif
                            <!--begin::Input group-->
                            <div class="fv-row mb-10">
                                <div class="row">

                                    {{-- @foreach (Config('language') as $key => $lang)
                                        <div class="col-6 my-3">
                                            <label class="fs-5 fw-bold form-label mb-5">Title in {{ $lang}}:</label>
                                            <!--end::Label-->
                                            <!--begin::Input-->
                                            <input type="text" class="form-control form-control-solid" value="{{ old('title.'.$key) ?? $car->getTranslation('title',$key)}}" placeholder="{{ $lang }}" name="title[{{ $key}}]" required/>
                                            @error('title.'.$key)
                                            <span class="text-danger" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                            @enderror
                                        </div>
                                    @endforeach --}}

                                    <div class="col-6 mt-5">
                                        <label class="fs-5 fw-bold form-label mb-5">Brands:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <select name="brand_id" id="brand" class="form-control form-control-solid" required>
                                            <option value="">---</option>
                                            @foreach ($brands as $brand)
                                            <option value="{{ $brand->id }}" {{ $brand->id == $car->brand_id ? 'selected' : ''}}>{{ $brand->name }}</option>
                                            @endforeach
                                        </select>
                                        @error('brand_id')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-6 mt-5">
                                        <label class="fs-5 fw-bold form-label mb-5">Models:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <select name="car_model_id" id="model" class="form-control form-control-solid" required>

                                        </select>
                                        @error('car_model_id')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-6 mt-5">
                                        <label class="fs-5 fw-bold form-label mb-5">Extensions:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <select name="car_model_extension_id" id="extension" class="form-control form-control-solid" required>
                                        </select>
                                        @error('car_model_id')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-6 mt-5">
                                        <label class="fs-5 fw-bold form-label mb-5">Price:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <input type="number" class="form-control form-control-solid" value="{{ old('price') ?? $car->price }}" placeholder="price" name="price" required />
                                        @error('price')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-6 mt-5">
                                        <label class="fs-5 fw-bold form-label mb-5">Year:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->

                                        <select name="year" class="form-control form-control-solid" required>
                                            <option value="">---</option>
                                            @foreach ($years as $year)
                                            <option value="{{ $year}}" {{ $year == $car->year ? 'selected' : '' }}>
                                                {{ $year }}
                                            </option>
                                            @endforeach
                                        </select>
                                        @error('year')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-6 mt-5">
                                        <label class="fs-5 fw-bold form-label mb-5">Color:</label>
                                        <!--begin::Input-->
                                        <input type="text" class="form-control form-control-solid" value="{{ old('color') ?? $car->color }}" placeholder="Color" name="color" required />

                                        @error('color')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>


                {{--                    <div class="col-6 mt-5">
                                        <label class="fs-5 fw-bold form-label mb-5">Status:</label>
                                        <!--end::Label-->

                                        <!--begin::Input-->
                                        <select name="status" id="status" class="form-control form-control-solid" required>
                                            <option value="">---</option>
                                            @foreach (getCarStatus() as $statusType)
                                                <option value="{{ $statusType->key }}" {{ $statusType->key == $car->status ? 'selected' : ''}}>
                                                    {{ $statusType->name }}
                                                </option>
                                            @endforeach
                                        </select>

                                        @error('status')
                                            <span class="text-danger" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>--}}


                                    <div class="col-6 mt-5">
                                        <label class="fs-5 fw-bold form-label mb-5">Drive Type:</label>
                                        <!--end::Label-->

                                        <!--begin::Input-->
                                        <select name="drive_type" id="drive_type" class="form-control form-control-solid" required>
                                            <option value="">---</option>
                                            @foreach (getDriveTypes() as $driveType)
                                            <option value="{{ $driveType->key }}" {{ $driveType->key == $car->drive_type ? 'selected' : ''}}>
                                                {{ $driveType->name }}
                                            </option>
                                            @endforeach
                                        </select>

                                        @error('drive_type')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-6 mt-5">

                                        <label class="fs-5 fw-bold form-label mb-5">Body Types:</label>
                                        <!--end::Label-->

                                        <!--begin::Input-->
                                        <select name="car_type_id" id="body_type" class="form-control form-control-solid" required>
                                            <option value="">---</option>
                                            @foreach ($carTypes as $carType)
                                            <option value="{{ $carType->id }}" {{ $carType->id == $car->car_type_id ? 'selected' : ''}}>
                                                {{ $carType->name }}
                                            </option>
                                            @endforeach
                                        </select>

                                        @error('car_type_id')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-6 mt-5">

                                        <label class="fs-5 fw-bold form-label mb-5">Fuel Types:</label>
                                        <!--end::Label-->

                                        <!--begin::Input-->
                                        <select name="fuel_type" id="fuel_type" class="form-control form-control-solid" required>
                                            <option value="">---</option>
                                            @foreach (getFuelTypes() as $fuelType)
                                            <option value="{{ $fuelType->key }}" {{ $fuelType->key == $car->fuel_type ? 'selected' : ''}}>
                                                {{ $fuelType->name }}
                                            </option>
                                            @endforeach
                                        </select>

                                        @error('fuel_type')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-6 mt-5">
                                        <label class="fs-5 fw-bold form-label mb-5">Engine:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <input type="text" class="form-control form-control-solid" value="{{ old('engine') ?? $car->engine }}" placeholder="engine" name="engine" required />
                                        @error('engine')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-6 mt-5">
                                        <label class="fs-5 fw-bold form-label mb-5">Cylinders:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <input type="text" class="form-control form-control-solid" value="{{ old('cylinders') ?? $car->cylinders }}" placeholder="cylinders" name="cylinders" required />
                                        @error('cylinders')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

{{--
                                    <div class="col-6 mt-5">
                                        <label class="fs-5 fw-bold form-label mb-5">Kilometers:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <input type="text" class="form-control form-control-solid" value="{{ old('mileage') ?? $car->mileage }}" placeholder="mileage" name="mileage" required />
                                        @error('mileage')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
--}}

                                    <div class="col-12 mt-5">
                                        <label class="fs-5 fw-bold form-label mb-5">Description:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <textarea name="description" class="form-control" cols="10" rows="5">{{ old('description') ?? $car->description }}</textarea>

                                        @error('description')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="row mt-4">
                                        <div class="col-lg-3 col-12 mb-3">
                                            <h3 class="mb-4"> Main Image</h3>
                                            <!--end::Image input placeholder-->
                                            <div class="image-input image-input-empty image-input-outline image-input-placeholder mb-3" data-kt-image-input="true" style="background: url('{{ $car->getLogo() }}');background-size:cover;">
                                                <!--begin::Preview existing avatar-->
                                                <div class="image-input-wrapper w-200px h-200px"></div>
                                                <!--end::Preview existing avatar-->
                                                <!--begin::Label-->
                                                <label class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow" data-kt-image-input-action="change" data-bs-toggle="tooltip" title="Change avatar">
                                                    <i class="bi bi-pencil-fill fs-7"></i>
                                                    <!--begin::Inputs-->
                                                    <input type="file" name="main_image" accept=".png, .jpg, .jpeg ,.svg ,.webp"  @if($method != 'PUT')  required  @endif />

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
                                        <div class="col-lg-3 col-12 mb-3">
                                            <h3 class="mb-4"> Door 1 </h3>
                                            <!--end::Image input placeholder-->
                                            <div class="image-input image-input-empty image-input-outline image-input-placeholder mb-3" data-kt-image-input="true" style="background: url('{{ $car->getImageDoor1() }}');background-size:cover;">
                                                <!--begin::Preview existing avatar-->
                                                <div class="image-input-wrapper w-200px h-200px"></div>
                                                <!--end::Preview existing avatar-->
                                                <!--begin::Label-->
                                                <label class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow" data-kt-image-input-action="change" data-bs-toggle="tooltip" title="Change avatar">
                                                    <i class="bi bi-pencil-fill fs-7"></i>
                                                    <!--begin::Inputs-->
                                                    <input type="file" name="door-1" accept=".png, .jpg, .jpeg ,.svg ,.webp" @if($method != 'PUT')  required  @endif/>

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
                                        <div class="col-lg-3 col-12 mb-3">
                                            <h3 class="mb-4"> Door 2 </h3>
                                            <!--end::Image input placeholder-->
                                            <div class="image-input image-input-empty image-input-outline image-input-placeholder mb-3" data-kt-image-input="true" style="background: url('{{ $car->getImageDoor2() }}');background-size:cover;">
                                                <!--begin::Preview existing avatar-->
                                                <div class="image-input-wrapper w-200px h-200px"></div>
                                                <!--end::Preview existing avatar-->
                                                <!--begin::Label-->
                                                <label class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow" data-kt-image-input-action="change" data-bs-toggle="tooltip" title="Change avatar">
                                                    <i class="bi bi-pencil-fill fs-7"></i>
                                                    <!--begin::Inputs-->
                                                    <input type="file" name="door-2" accept=".png, .jpg, .jpeg ,.svg ,.webp" @if($method != 'PUT')  required  @endif />
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
                                        <div class="col-lg-3 col-12 mb-3">
                                            <h3 class="mb-4"> Door 3 </h3>
                                            <!--end::Image input placeholder-->
                                            <div class="image-input image-input-empty image-input-outline image-input-placeholder mb-3" data-kt-image-input="true" style="background: url('{{ $car->getImageDoor3() }}');background-size:cover;">
                                                <!--begin::Preview existing avatar-->
                                                <div class="image-input-wrapper w-200px h-200px"></div>
                                                <!--end::Preview existing avatar-->
                                                <!--begin::Label-->
                                                <label class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow" data-kt-image-input-action="change" data-bs-toggle="tooltip" title="Change avatar">
                                                    <i class="bi bi-pencil-fill fs-7"></i>
                                                    <!--begin::Inputs-->
                                                    <input type="file" name="door-3" accept=".png, .jpg, .jpeg ,.svg ,.webp" @if($method != 'PUT')  required  @endif />
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
                                        <div class="col-lg-3 col-12 mb-3">
                                            <h3 class="mb-4"> Door 4 </h3>
                                            <!--end::Image input placeholder-->
                                            <div class="image-input image-input-empty image-input-outline image-input-placeholder mb-3" data-kt-image-input="true" style="background: url('{{ $car->getImageDoor4() }}');background-size:cover;">
                                                <!--begin::Preview existing avatar-->
                                                <div class="image-input-wrapper w-200px h-200px"></div>
                                                <!--end::Preview existing avatar-->
                                                <!--begin::Label-->
                                                <label class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow" data-kt-image-input-action="change" data-bs-toggle="tooltip" title="Change avatar">
                                                    <i class="bi bi-pencil-fill fs-7"></i>
                                                    <!--begin::Inputs-->
                                                    <input type="file" name="door-4" accept=".png, .jpg, .jpeg ,.svg ,.webp" @if($method != 'PUT')  required  @endif />
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
                                        <div class="col-12">
                                            <label for=""> Images</label>
                                            <input type="file" name="images[]" multiple class="form-control">
                                        </div>
                                    </div>

                                    <div class="row my-5 py-5">
                                        <h3>Features</h3>
                                        @foreach ($features as $feature)
                                        <div class="col-4">
                                            <h4 class="my-3">{{ $feature->name }} </h4>
                                            @foreach ($feature->options as $option)
                                            <div class="">
                                                <input type="checkbox" name="features[]" value="{{ $option->id }}" {{ in_array($option->id , $car->options->pluck('id')->toArray()) ?
                                                 'checked' : ''}} style="width:20px ; height:20px;">
                                                <label for="" style="font-size: 18px"> {{ $option->name}} </label>
                                            </div>
                                            @endforeach
                                        </div>
                                        @endforeach
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

    @push('admin_js')
         @include('admin.pages.cars.scripts')
    @endpush
