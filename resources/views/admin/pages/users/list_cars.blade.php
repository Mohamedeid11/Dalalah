@extends('admin.layouts.app')

@section('crumb')
<x-bread-crumb :breadcrumbs="[
        ['text'=>'users','link'=>route('admin.user.index')],
        ['text'=>$user->name],
        ['text'=> 'cars']
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
                    <!--begin::Card title-->
                    <div class="card-title">
                        <!--begin::Search-->
                        <div class="d-flex align-items-center position-relative my-1">
                            <!--begin::Svg Icon | path: icons/duotune/general/gen021.svg-->
                            <span class="svg-icon svg-icon-1 position-absolute ms-6">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                                    <rect opacity="0.5" x="17.0365" y="15.1223" width="8.15546" height="2" rx="1" transform="rotate(45 17.0365 15.1223)" fill="black" />
                                    <path d="M11 19C6.55556 19 3 15.4444 3 11C3 6.55556 6.55556 3 11 3C15.4444 3 19 6.55556 19 11C19 15.4444 15.4444 19 11 19ZM11 5C7.53333 5 5 7.53333 5 11C5 14.4667 7.53333 17 11 17C14.4667 17 17 14.4667 17 11C17 7.53333 14.4667 5 11 5Z" fill="black" />
                                </svg>
                            </span>
                            <form action="#">
                                <input type="text" name="name" value="{{ request()->name }}" class="form-control form-control-solid w-250px ps-15" placeholder="Search..." />
                            </form>
                            <!--end::Svg Icon-->
                        </div>
                        <!--end::Search-->
                    </div>
                    <!--begin::Card title-->
                    <!--begin::Card toolbar-->
                    <div class="card-toolbar">
                        <!--begin::Toolbar-->

                    </div>
                    <!--end::Card toolbar-->
                </div>
                <!--end::Card header-->
                <!--begin::Card body-->
                <div class="card-body pt-0" style="overflow: auto;">
                    <!--begin::Table-->
                    <table class="table align-middle table-row-dashed fs-6 gy-5" id="kt_customers_table">
                        <!--begin::Table head-->
                        <thead>
                            <!--begin::Table row-->
                            <tr class="text-start text-gray-400 fw-bolder fs-7 text-uppercase gs-0">
                                <th class="min-w-125px">brand</th>
                                <th class="min-w-125px">Model</th>
                                <th class="min-w-125px">Extentsion</th>
                                <th class="min-w-125px">Price</th>
                                <th class="min-w-125px">Status</th>
                                <th class="min-w-125px">Year</th>
                                <th class="min-w-125px">Is Sold</th>
                                <th class="min-w-125px">Is Hide</th>
                                <th class="min-w-125px">Is Approved</th>
                                <th class="text-end min-w-70px">Actions</th>
                            </tr>
                            <!--end::Table row-->
                        </thead>
                        <!--end::Table head-->
                        <!--begin::Table body-->
                        <tbody class="fw-bold text-gray-600">
                            @if(count($cars))
                            @foreach ($cars as $car)
                            <tr>
                                <!--begin::Email=-->
                                <td>
                                    <a href="#" class="text-gray-600 text-hover-primary mb-1">
                                        {{ $car?->brand?->name }}
                                    </a>
                                </td>
                                <td>
                                    {{ $car?->brandModel?->name }}
                                </td>
                                <td>
                                    {{ $car?->brandModelExtension?->name }}
                                </td>
                                <td>
                                    {{ $car->price }}
                                </td>
                                <td>
                                    {{ $car->status }}
                                </td>
                                <td>
                                    {{ $car->year }}
                                </td>
                                <td>
                                    @if($car->status_buyed == 'buyed')
                                        <button class="badge bg-success" style="border: transparent;"> yes </button>
                                    @else
                                       <button class="badge bg-primary" style="border: transparent;"> No </>
                                    @endif
                                </td>
                                
                                <td class="text-center">
                                    <label class="form-check form-switch form-check-custom form-check-solid">
                                        <input type="checkbox" onchange="changeStatus('{{route('admin.car.hide',$car->id)}}')" class="form-check-input" name="is_hide" @if ($car->is_hide) checked @endif>
                                    </label>
                                </td>

                                <td class="text-center">
                                    <label class="form-check form-switch form-check-custom form-check-solid">
                                        <input type="checkbox" onchange="changeStatus('{{route('admin.car.approve',$car->id)}}')" class="form-check-input" name="is_approved" @if ($car->is_approved) checked disabled @endif>
                                    </label>
                                </td>

                                <td class="text-end">
                                    <a href="#" class="btn btn-sm btn-light btn-active-light-primary" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end" data-kt-menu-flip="top-end">Actions
                                        <!--begin::Svg Icon | path: icons/duotune/arrows/arr072.svg-->
                                        <span class="svg-icon svg-icon-5 m-0">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                                                <path d="M11.4343 12.7344L7.25 8.55005C6.83579 8.13583 6.16421 8.13584 5.75 8.55005C5.33579 8.96426 5.33579 9.63583 5.75 10.05L11.2929 15.5929C11.6834 15.9835 12.3166 15.9835 12.7071 15.5929L18.25 10.05C18.6642 9.63584 18.6642 8.96426 18.25 8.55005C17.8358 8.13584 17.1642 8.13584 16.75 8.55005L12.5657 12.7344C12.2533 13.0468 11.7467 13.0468 11.4343 12.7344Z" fill="black" />
                                            </svg>
                                        </span>
                                        <!--end::Svg Icon--></a>
                                    <!--begin::Menu-->
                                    <div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-600 menu-state-bg-light-primary fw-bold fs-7 w-125px py-4" data-kt-menu="true">
                                        @adminCan('cars.read')
                                        <!--begin::Menu item-->
                                        <div class="menu-item px-3">
                                            <a href="{{ route('admin.car.show',$car->id) }}" class="menu-link px-3">View</a>
                                        </div>
                                        <!--end::Menu item-->
                                        @endadminCan
                                  
                                    </div>
                                    <!--end::Menu-->
                                </td>
                                <!--end::Action=-->
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
                    <div> {{ $cars->links() }} </div>
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

<script>
    function changeStatus(url) {
        $.ajax({
            url: url
            , data: ''
            , type: 'GET'
            , beforeSend: function() {
                $('.overlay-body-loader').css('display', 'flex');
            }
            , success: function(res) {
                location.reload();
            }
            , complete: function(data) {
                $('.overlay-body-loader').css('display', 'none');
            }
        });
    }
</script>

@endpush
