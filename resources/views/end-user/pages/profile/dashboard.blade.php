@extends('end-user.layouts.app')

@section('content')
<main class="main">
    <!-- breadcrumb -->
    <div class="site-breadcrumb" style="background: url('{{ asset('end-user/assets/img/breadcrumb/01.png')}}')">
        <div class="container">
            <h2 class="breadcrumb-title">Profile</h2>
            <ul class="breadcrumb-menu">
                <li><a href="{{ route('end-user.index') }}">Home</a></li>
                <li class="active">Dashboard</li>
            </ul>
        </div>
    </div>
    <!-- breadcrumb end -->

    <!-- user-profile -->
    <div class="user-profile py-120">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    @include('end-user.layouts.profile_sidebar')
                </div>
                <div class="col-lg-9">
                    <div class="user-profile-wrapper">
                        <div class="row">

                            <div class="col-md-6 col-lg-4">
                                <div class="dashboard-widget dashboard-widget-color-3">
                                    <div class="dashboard-widget-info">
                                        <h1>{{$allHide}}</h1>
                                        <span>Hide Cars</span>
                                    </div>
                                    <div class="dashboard-widget-icon">
                                        <i class="fal fa-list"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-4">
                                <div class="dashboard-widget dashboard-widget-color-1">
                                    <div class="dashboard-widget-info">
                                        <h1>{{$allApproved}}</h1>
                                        <span>Approved Cars</span>
                                    </div>
                                    <div class="dashboard-widget-icon">
                                        <i class="fal fa-list"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-4">
                                <div class="dashboard-widget dashboard-widget-color-2">
                                    <div class="dashboard-widget-info">
                                        <h1>{{$allCars}}</h1>
                                        <span>Total Listing</span>
                                    </div>
                                    <div class="dashboard-widget-icon">
                                        <i class="fal fa-layer-group"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="user-profile-card">
                                    <h4 class="user-profile-card-title">Recent Listing</h4>

                                    <div class="table-responsive">
                                        <table class="table text-nowrap">
                                            <thead>
                                                <tr>
                                                    <th>Brand</th>
                                                    <th>Model</th>
                                                    <th>Publish</th>
                                                    <th>Price</th>
                                                    <th>Is Sold</th>
                                                    <th>Is Hide</th>
                                                    <th>Is Approved</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach ($cars as $car)
                                                <tr>
                                                    <td>
                                                        <div class="table-list-info">
                                                            <a href="#">
                                                                <img src="{{ $car->brand?->getAvatar() }}" alt="">
                                                                <div class="table-ad-content">
                                                                    <h6>{{ $car->brand?->name }}</h6>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        {{ $car->brandModel?->name }}
                                                    </td>
                                                    <td>
                                                        {{ $car->getDateHuman() }}
                                                    </td>
                                                    <td>
                                                        {{ $car->getPrice() }}
                                                    </td>
                                                    <td>
                                                        <div class="form-check form-switch">
                                                            <input class="form-check-input" onchange="changeStatus('{{route('end-user.sold.car',$car->id)}}')" name="buyed" value="1" type="checkbox" role="switch" id="privacy-setting-1" @if ($car->status_buyed == 'buyed') checked disabled @endif>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        @if($car->is_hide)
                                                        <span class="badge badge-danger"> Hide </span>
                                                        @else
                                                        <span class="badge badge-success"> Active </span>
                                                        @endif
                                                    </td>
                                                    <td>
                                                        @if($car->is_approved == 0)
                                                        <span class="badge badge-danger"> Deactive </span>
                                                        @else
                                                        <span class="badge badge-success"> Active </span>
                                                        @endif
                                                    </td>
                                                    <td>
                                                        {{-- <a href="#" class="btn btn-outline-secondary btn-sm rounded-2" data-bs-toggle="tooltip" title="Details"><i class="far fa-eye"></i></a> --}}
                                                        <a href="{{ route('end-user.profile.editlist',$car->id) }}" class="btn btn-outline-secondary btn-sm rounded-2" data-bs-toggle="tooltip" title="Edit"><i class="far fa-pen"></i></a>
                                                        {{-- <a href="#" class="btn btn-outline-danger btn-sm rounded-2" data-bs-toggle="tooltip" title="Delete"><i class="far fa-trash-can"></i></a> --}}
                                                    </td>
                                                </tr>
                                                @endforeach
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="pagination-area">
                                        {{ $cars->links() }}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- user-profile end -->
</main>
@endsection


@push('scripts')
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