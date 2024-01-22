@extends('admin.layouts.app')

@section('crumb')
<x-bread-crumb :breadcrumbs="[]" :button="[]">
</x-bread-crumb>
@endsection

@section('content')

<div class="row mt-5">
    <div class="col-xl-3">
        <!--begin::Statistics Widget 5-->
        <a href="{{ route('admin.car.index') }}" class="card bg-body hoverable card-xl-stretch mb-xl-8">
            <!--begin::Body-->
            <div class="card-body">
                <!--begin::Svg Icon | path: icons/duotune/general/gen032.svg-->
                <span class="svg-icon ms-n1">
                    <img src="{{ asset('dashboard/assets/img/car.jpg') }}" width="50" height="50" loading="lazy" alt="">
                </span>
                <!--end::Svg Icon-->
                <div class="text-inverse-body fw-bolder fs-2 mb-2 mt-5">{{ $cars }}</div>
                <div class="fw-bold text-inverse-body fs-7">CARS</div>
            </div>
            <!--end::Body-->
        </a>
        <!--end::Statistics Widget 5-->
    </div>
    <div class="col-xl-3">
        <!--begin::Statistics Widget 5-->
        <a href="{{ route('admin.showroom.index') }}" class="card bg-dark hoverable card-xl-stretch mb-xl-8">
            <!--begin::Body-->
            <div class="card-body">
                <!--begin::Svg Icon | path: icons/duotune/ecommerce/ecm008.svg-->
                <span class="svg-icon svg-icon-white svg-icon-3x ms-n1">
                    <img src="{{ asset('dashboard/assets/img/showroom.png') }}" width="50" height="50" loading="lazy" alt="">
                </span>
                <!--end::Svg Icon-->
                <div class="text-inverse-dark fw-bolder fs-2 mb-2 mt-5">{{ $showrooms }}</div>
                <div class="fw-bold text-inverse-dark fs-7">SHOWROOMS</div>
            </div>
            <!--end::Body-->
        </a>
        <!--end::Statistics Widget 5-->
    </div>
    <div class="col-xl-3">
        <!--begin::Statistics Widget 5-->
        <a href="{{ route('admin.showroom.index') }}" class="card bg-primary hoverable card-xl-stretch mb-xl-8">
            <!--begin::Body-->
            <div class="card-body">
                <!--begin::Svg Icon | path: icons/duotune/finance/fin006.svg-->
                <span class="svg-icon svg-icon-white svg-icon-3x ms-n1">
                    <img src="{{ asset('dashboard/assets/img/agency.webp') }}" width="50" height="50" loading="lazy" alt="">
                </span>
                <!--end::Svg Icon-->
                <div class="text-inverse-warning fw-bolder fs-2 mb-2 mt-5">{{ $agencies }}</div>
                <div class="fw-bold text-inverse-warning fs-7"> AGENCIES </div>
            </div>
            <!--end::Body-->
        </a>
        <!--end::Statistics Widget 5-->
    </div>
    <div class="col-xl-3">
        <!--begin::Statistics Widget 5-->
        <a href="{{ route('admin.user.index') }}" class="card bg-info hoverable card-xl-stretch mb-5 mb-xl-8">
            <!--begin::Body-->
            <div class="card-body">
                <!--begin::Svg Icon | path: icons/duotune/graphs/gra007.svg-->
                <span class="svg-icon svg-icon-white svg-icon-3x ms-n1">
                    <img src="{{ asset('dashboard/assets/img/user.png') }}" width="50" height="50" loading="lazy" alt="">
                </span>
                <!--end::Svg Icon-->
                <div class="text-inverse-info fw-bolder fs-2 mb-2 mt-5">{{ $users }}</div>
                <div class="fw-bold text-inverse-info fs-7">USERS</div>
            </div>
            <!--end::Body-->
        </a>
        <!--end::Statistics Widget 5-->
    </div>
</div>

<div class="row mb-5  py-5">

    <div class="col-6">
        <div class="card card-xl-stretch mb-5 mb-xl-8">
            <!--begin::Header-->
            <div class="card-header border-0 pt-5">
                <h3 class="card-title align-items-start flex-column text-center">
                    <span class="card-label fw-bolder fs-3 mb-1 ">Users</span>
                </h3>
            </div>
            <!--end::Header-->
            <!--begin::Body-->
            <div class="card-body py-3">
                <!--begin::Table container-->
                <div class="table-responsive">
                    <!--begin::Table-->
                    <table class="table table-row-dashed table-row-gray-300 align-middle gs-0 gy-4">
                        <!--begin::Table head-->
                        <thead>
                            <tr class="fw-bolder text-muted">
                                <th class="min-w-150px">Name</th>
                                <th class="min-w-140px">Phone</th>
                                <th class="min-w-120px">createdAt</th>
                            </tr>
                        </thead>
                        <!--end::Table head-->
                        <!--begin::Table body-->
                        <tbody>
                            @if(count($lastUsers))
                            @foreach ($lastUsers as $user)
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <a href="{{ route('admin.user.index') }}" class="text-dark fw-bolder text-hover-primary">{{ $user->name }}</a>
                                        </div>
                                    </td>
                                    <td>
                                        <span class="text-muted fw-bold text-muted d-block fs-7">{{ $user->phone ?? '-'}}</span>
                                    </td>
                                    <td>
                                        <span class="text-muted fw-bold text-muted d-block fs-7"> {{ date('Y-m-d' ,strtotime($user->created_at)) }}</span>
                                    </td>
                                </tr>
                            @endforeach
                            @else
                            <tr class="text-danger">
                                <td></td>
                                <td> no data found</td>
                                <td></td>
                            </tr>
                            @endif
                        </tbody>
                        <!--end::Table body-->
                    </table>
                    <!--end::Table-->
                </div>
                <!--end::Table container-->
            </div>
            <!--begin::Body-->
        </div>
    </div>

    <div class="col-6">
        <div class="card card-xl-stretch mb-5 mb-xl-8">
            <!--begin::Header-->
            <div class="card-header border-0 pt-5">
                <h3 class="card-title align-items-start flex-column text-center">
                    <span class="card-label fw-bolder fs-3 mb-1 ">Showrooms / Agencies</span>
                </h3>
            </div>
            <!--end::Header-->
            <!--begin::Body-->
            <div class="card-body py-3">
                <!--begin::Table container-->
                <div class="table-responsive">
                    <!--begin::Table-->
                    <table class="table table-row-dashed table-row-gray-300 align-middle gs-0 gy-4">
                        <!--begin::Table head-->
                        <thead>
                            <tr class="fw-bolder text-muted">
                                <th class="min-w-150px">Name</th>
                                <th class="min-w-150px">Type</th>
                                <th class="min-w-140px">Phone</th>
                                <th class="min-w-120px">createdAt</th>
                            </tr>
                        </thead>
                        <!--end::Table head-->
                        <!--begin::Table body-->
                        <tbody>
                            @if(count($lastShowrooms))
                             @foreach ($lastShowrooms as $Showroom)
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <a href="{{ route('admin.showroom.index') }}" class="text-dark fw-bolder text-hover-primary">{{ $Showroom->showroom_name }}</a>
                                        </div>
                                    </td>
                                      <td>
                                        <span class="text-muted fw-bold text-muted d-block fs-7">{{ $Showroom->type ?? '-'}}</span>
                                    </td>
                                    <td>
                                        <span class="text-muted fw-bold text-muted d-block fs-7">{{ $Showroom->phone ?? '-'}}</span>
                                    </td>
                                    <td>
                                        <span class="text-muted fw-bold text-muted d-block fs-7"> {{ date('Y-m-d' ,strtotime($Showroom->created_at)) }}</span>
                                    </td>
                                </tr>
                            @endforeach
                            @else
                            <tr class="text-danger">
                                <td></td>
                                <td> no data found</td>
                                <td></td>
                            </tr>
                            @endif
                        </tbody>
                        <!--end::Table body-->
                    </table>
                    <!--end::Table-->
                </div>
                <!--end::Table container-->
            </div>
            <!--begin::Body-->
        </div>
    </div>
    
</div>

@endsection
