@extends('admin.layouts.app')

@section('crumb')
<x-bread-crumb :breadcrumbs="[
    ['text'=>'Payment','link'=>route('admin.push_notification.index')],
    ['text'=> 'list']
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
                        {{--
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
                        --}}
                    </div>
                    <!--begin::Card title-->
                </div>
                <!--end::Card header-->
                <!--begin::Card body-->
                <div class="card-body pt-0">
                    <!--begin::Table-->
                    <table class="table align-middle table-row-dashed fs-6 gy-5" id="kt_customers_table">
                        <!--begin::Table head-->
                        <thead>
                            <!--begin::Table row-->
                            <tr class="text-start text-gray-400 fw-bolder fs-7 text-uppercase gs-0">
                                <th class="min-w-125px">Ref</th>
                                <th class="min-w-125px">Payment ID</th>
                                <th class="min-w-125px">User</th>
                                <th class="min-w-125px">User Type</th>
                                <th class="min-w-125px">Payment Type</th>
                                <th class="min-w-125px">Transaction Status</th>
                                <th class="min-w-125px">Amount</th>
                                <th class="min-w-125px">Payment from </th>
                                <th class="min-w-125px">Payment Type </th>
                                <th class="min-w-125px">Created At</th>
                            </tr>
                            <!--end::Table row-->
                        </thead>
                        <!--end::Table head-->
                        <!--begin::Table body-->
                        <tbody class="fw-bold text-gray-600">
                            @if(count($payments))
                            @foreach ($payments as $payment)
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                <td>
                                    <a href="#" class="text-gray-600 text-hover-primary mb-1">{{ $payment->paymentId }}</a>
                                </td>
                                <td>
                                    <a href="#" class="text-gray-600 text-hover-primary mb-1">{{ $payment->paymentable->name ?? $payment->paymentable->showroom_name   }}</a>
                                </td>
                                <td>
                                    <a href="#" class="text-gray-600 text-hover-primary mb-1">{{ $payment->user_type }}</a>
                                </td>
                                <td>
                                    <a href="#" class="text-gray-600 text-hover-primary mb-1">{{ $payment->payment_type }}</a>
                                </td>
                               <td>
                                    <a href="#" class="text-gray-600 text-hover-primary mb-1">{{ $payment->status }}</a>
                               </td>
                                <td>
                                    <a href="#" class="text-gray-600 text-hover-primary mb-1">{{ $payment->amount }}</a>
                                </td>
                                <td>
                                    <a href="#" class="text-gray-600 text-hover-primary mb-1">{{ $payment->paymentType }}</a>
                                </td>
                                <td>
                                    <a href="#" class="text-gray-600 text-hover-primary mb-1">{{ $payment->payment_from }}</a>
                                </td>
                                <td>
                                    <a href="#" class="text-gray-600 text-hover-primary mb-1">{{ $payment->created_at->format('Y-m-d') }}</a>
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
                    <div>{{ $payments->links() }}</div>
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
