@extends('end-user.layouts.app')

@section('content')
<main class="main">

    <!-- breadcrumb -->
    <div class="site-breadcrumb" style="background: url('{{ asset('end-user/assets/img/breadcrumb/01.png')}}')">
        <div class="container">
            <h2 class="breadcrumb-title"> Cars</h2>
            <ul class="breadcrumb-menu">
                <li><a href="{{ route('end-user.index') }}">Home</a></li>
                <li class="active"> Cars</li>
            </ul>
        </div>
    </div>
    <!-- breadcrumb end -->

    <!-- user-profile -->
    <div class="user-profile py-120">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    @include('showroom.layouts.profile_sidebar')
                </div>
                <div class="col-lg-9">
                    <div class="user-profile-wrapper">
                        <div class="user-profile-card profile-ad">
                            <div class="user-profile-card-header">
                                <h4 class="user-profile-card-title">{{ request()->status }} Cars</h4>
                                <div class="user-profile-card-header-right">
                                    {{-- <div class="user-profile-search">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Search...">
                                            <i class="far fa-search"></i>
                                        </div>
                                    </div> --}}
                                    {{-- <a href="#" class="theme-btn"><span class="far fa-plus-circle"></span>Add Listing</a> --}}
                                </div>
                            </div>
                            <div class="col-lg-12">
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
                                                        <input class="form-check-input" onchange="changeStatus('{{route('showroom.sold.car',$car->id)}}')" name="buyed" value="1" type="checkbox" role="switch" id="privacy-setting-1" @if ($car->status_buyed == 'buyed') checked disabled @endif>
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
                                                    <a href="{{ route('showroom.profile.editlist',$car->id) }}" class="btn btn-outline-secondary btn-sm rounded-2" data-bs-toggle="tooltip" title="Edit"><i class="far fa-pen"></i></a>
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
    <!-- user-profile end -->

</main>
@endsection
