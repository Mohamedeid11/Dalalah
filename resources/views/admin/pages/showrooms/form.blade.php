@extends('admin.layouts.app')

@section('crumb')
<x-bread-crumb :breadcrumbs="[
            ['text'=>'ShowRooms | Agencies','link'=>route('admin.showroom.index')],
            ['text'=> getLastKeyRoute(request()->route()->getName())]
            ]" :button="['text'=>'Go To ShowRooms | Agencies','link'=>route('admin.showroom.index')]">
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
                                    <div class="col-12 my-5">
                                        <label class="fs-5 fw-bold form-label mb-5">Type:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <select name="type" class="form-control form-control-solid" required>
                                            <option value="">---</option>
                                            @foreach (showroomType() as $key => $type)
                                            <option value="{{ $key }}" {{ $key == $showroom->type ? 'selected' : ''}}>{{ $type }}</option>
                                            @endforeach
                                        </select>
                                        @error('type')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    @foreach (Config('language') as $key => $lang)
                                        <div class="col-6">
                                            <label class="fs-5 fw-bold form-label mb-5">Showroom | agency Name in {{ $lang}}:</label>
                                            <!--end::Label-->
                                            <!--begin::Input-->
                                            <input type="text" class="form-control form-control-solid" value="{{ old('showroom_name.'.$key) ?? $showroom->getTranslation('showroom_name',$key)}}" placeholder="{{ $lang }}" name="showroom_name[{{ $key}}]" required />
                                            @error('showroom_name.'.$key)
                                            <span class="text-danger" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                            @enderror
                                        </div>
                                    @endforeach

                                    @foreach (Config('language') as $key => $lang)
                                        <div class="col-6 mt-5">
                                            <label class="fs-5 fw-bold form-label mb-5">Owner Name in {{ $lang}}:</label>
                                            <!--end::Label-->
                                            <!--begin::Input-->
                                            <input type="text" class="form-control form-control-solid" value="{{ old('owner_name.'.$key) ?? $showroom->getTranslation('owner_name',$key)}}" placeholder="{{ $lang }}" name="owner_name[{{ $key}}]" required />
                                            @error('owner_name.'.$key)
                                            <span class="text-danger" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                            @enderror
                                        </div>
                                    @endforeach

                                    @foreach (Config('language') as $key => $lang)
                                        <div class="col-6 mt-5">
                                            <label class="fs-5 fw-bold form-label mb-5">Description in {{ $lang}}:</label>
                                            <!--end::Label-->
                                            <!--begin::Input-->
                                            <textarea name="description[{{$key}}]" class="form-control form-control-solid" cols="10" rows="5" required> {{ old('description.'.$key) ?? $showroom->getTranslation('description',$key)}} </textarea>
                                            @error('description.'.$key)
                                            <span class="text-danger" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                            @enderror
                                        </div>
                                    @endforeach

                                    <div class="col-6 mt-5">
                                        <label class="fs-5 fw-bold form-label mb-5">Phone:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <input type="number" class="form-control form-control-solid" value="{{ old('phone') ?? $showroom->phone}}" placeholder="Phone" name="phone" required/>
                                        @error('phone')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-6 mt-5">
                                        <label class="fs-5 fw-bold form-label mb-5">Phone:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <input type="email" class="form-control form-control-solid" value="{{ old('email') ?? $showroom->email}}" placeholder="email" name="email" required/>
                                        @error('email')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-6 mt-5">
                                        <label class="fs-5 fw-bold form-label mb-5">Whatsapp:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <input type="number" class="form-control form-control-solid" value="{{ old('whatsapp') ?? $showroom->whatsapp}}" placeholder="Whatsapp" name="whatsapp" required />
                                        @error('whatsapp')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-6 mt-5">
                                        <label class="fs-5 fw-bold form-label mb-5">End Tax Card:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <input type="date" class="form-control form-control-solid" value="{{ old('end_tax_card') ?? $showroom->end_tax_card}}" placeholder="end tax card" name="end_tax_card" required />
                                        @error('end_tax_card')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-6 mt-5">
                                        <label class="fs-5 fw-bold form-label mb-5">password:</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <input type="password" class="form-control form-control-solid" placeholder="password" name="password"   @if(!$method == 'PUT') required @endif/>
                                        @error('password')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-6 mt-5">
                                        <label class="fs-5 fw-bold form-label mb-5">Packages:</label>
                                        <select name="package_id" class="form-control form-control-solid"  @if(!$method == 'PUT') required @endif>
                                            <option value="">---</option>
                                            @foreach ($packages as $package)
                                                <option value="{{ $package->id }}" {{ old('package_id') == $package->id ? 'selected' : '' }} {{ $package->id == $showroom->package_id ? 'selected' : '' }}> {{ $package->name }} </option>
                                            @endforeach
                                        </select>
                                        @error('package_id')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-6 mt-5">
                                        <label class="fs-5 fw-bold form-label mb-5">City :</label>
                                        <select name="city_id" class="form-control form-control-solid"  @if(!$method == 'PUT') required @endif>
                                            <option value="">---</option>
                                            @foreach ($cities as $city)
                                                <option value="{{ $city->id }}" {{ old('city_id') == $city->id ? 'selected' : '' }} {{ $city->id == $showroom->city_id ? 'selected' : '' }}> {{ $city->name }} </option>
                                            @endforeach
                                        </select>
                                        @error('city_id')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <div class="col-6 mt-5">
                                        <label class="fs-5 fw-bold form-label mb-5">District :</label>
                                        <select name="district_id" class="form-control form-control-solid"  @if(!$method == 'PUT') required @endif>
                                            <option value="">---</option>
                                            @foreach ($districts as $district)
                                                <option value="{{ $district->id }}" {{ old('district_id') == $district->id ? 'selected' : '' }} {{ $district->id == $showroom->district_id ? 'selected' : '' }}> {{ $district->name }} </option>
                                            @endforeach
                                        </select>
                                        @error('district_id')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>

                                    <hr class="my-5">

                                    <div class="col-4 my-3">
                                        <!--begin::Label-->
                                        <label class="fs-5 fw-bold form-label mb-5">Logo:</label>
                                        <!--end::Label-->
                                        <input type="file" class="form-control form-control-solid" name="logo"  @if(!$method == 'PUT') required @endif />
                                        @error('logo')
                                            <span class="text-danger" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror

                                        @if($showroom->getFirstMediaUrl('showrooms-logo') != null)
                                        <img src="{{ $showroom->getFirstMediaUrl('showrooms-logo') }}" alt="brand" width="200" height="200">
                                        @endif
                                    </div>

                                    <div class="col-4 my-3">
                                        <!--begin::Label-->
                                        <label class="fs-5 fw-bold form-label mb-5">Tax Card:</label>
                                        <!--end::Label-->
                                        <input type="file" class="form-control form-control-solid" name="tax_card"  @if(!$method == 'PUT') required @endif/>
                                        @error('tax_card')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror

                                        @if($showroom->getFirstMediaUrl('showrooms-tax_card') != null)
                                        <img src="{{ $showroom->getFirstMediaUrl('showrooms-tax_card') }}" alt="brand" width="200" height="200">
                                        @endif
                                    </div>

                                    <div class="col-4 my-3">
                                        <!--begin::Label-->
                                        <label class="fs-5 fw-bold form-label mb-5">commercial :</label>
                                        <!--end::Label-->
                                        <input type="file" class="form-control form-control-solid" name="commercial"  @if(!$method == 'PUT') required @endif/>
                                        @error('commercial')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror

                                        @if($showroom->getFirstMediaUrl('showrooms-commercial') != null)
                                        <img src="{{ $showroom->getFirstMediaUrl('showrooms-commercial') }}" alt="brand" width="200" height="200">
                                        @endif
                                    </div>

                                    <div class="col-4 my-3">
                                        <!--begin::Label-->
                                        <label class="fs-5 fw-bold form-label mb-5">Cover Image :</label>
                                        <!--end::Label-->
                                        <input type="file" class="form-control form-control-solid" name="cover_image"  @if(!$method == 'PUT') required @endif/>
                                        @error('cover_image')
                                        <span class="text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror

                                        @if($showroom->getFirstMediaUrl('showrooms-cover_image') != null)
                                        <img src="{{ $showroom->getFirstMediaUrl('showrooms-cover_image') }}" alt="brand" width="200" height="200">
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
