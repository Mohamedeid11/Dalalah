@extends('admin.layouts.app')

@section('crumb')
<x-bread-crumb :breadcrumbs="[
        ['text'=>'Contact'],
        ['text'=> getLastKeyRoute(request()->route()->getName())]
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

                        <div class="row my-5 py-5">
                            <div class="col-6 my-2">
                                <h3> Name : {{ $contact->name }}</h3>
                            </div>
                            <div class="col-6 my-2">
                                <h3> Email : {{ $contact->email }} </h3>
                            </div>
                            <div class="col-6 my-2">
                                <h3> Phone : {{ $contact->phone }} </h3>
                            </div>
                            <div class="col-6 my-2">
                                <h3> Subject : {{ $contact->subject }} </h3>
                            </div>
                            <div class="col-6 my-2">
                                <h3> message : {{ $contact->content }} </h3>
                            </div>
                        </div>

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
