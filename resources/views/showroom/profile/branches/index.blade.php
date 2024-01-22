@extends('end-user.layouts.app')

@section('content')
<main class="main">

    <!-- breadcrumb -->
    <div class="site-breadcrumb" style="background: url('{{ asset('end-user/assets/img/breadcrumb/01.png')}}')">
        <div class="container">
            <h2 class="breadcrumb-title">Branchs</h2>
            <ul class="breadcrumb-menu">
                <li><a href="{{ route('end-user.index') }}">Home</a></li>
                <li class="active">Branchs</li>
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
                                <h4 class="user-profile-card-title">Branchs</h4>
                                <div class="user-profile-card-header-right">
                                    {{-- <div class="user-profile-search">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Search...">
                                            <i class="far fa-search"></i>
                                        </div>
                                    </div> --}}
                                    <a href="{{ route('showroom.profile.create.branch') }}" class="theme-btn"><span class="far fa-plus-circle"></span>Add branch</a>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="table-responsive">
                                    <table class="table text-nowrap">
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th>Phone</th>
                                                <th>City</th>
                                                <th>District</th>
                                                <th>location</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($branches as $branch)
                                                <tr>
                                                    <td>
                                                        <h6>{{ $branch->name}}</h6>
                                                    </td>
                                                    <td>
                                                        <h6>{{ $branch->phone}}</h6>
                                                    </td>
                                                    </td>
                                                    <td>
                                                        <h6>{{ $branch->city?->name}}</h6>
                                                    </td>
                                                    <td>
                                                        <h6>{{ $branch->district?->name}}</h6>
                                                    </td>
                                                    <td> <a href="{{ $branch->link}}" target="_blank"><i class="fas fa-map-pin"></i></a> </td>
                                                    <td>
                                                        <a href="{{ route('showroom.profile.edit.branch',$branch->id) }}" class="btn btn-outline-secondary btn-sm rounded-2" data-bs-toggle="tooltip" title="Edit"><i class="far fa-pen"></i></a>
                                                        <form action="{{ route('showroom.profile.delete.branch', $branch->id) }}" method="POST" class="d-inline-block">
                                                            @csrf 
                                                            @method('DELETE')
                                                            <button class="btn btn-outline-danger btn-sm rounded-2"><i class="far fa-trash-can"></i></button>
                                                        </form>
                                                        {{-- <a href="#" class="btn btn-outline-danger btn-sm rounded-2" data-bs-toggle="tooltip" title="Delete"></a> --}}
                                                    </td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                                <!-- pagination -->
                                <div class="pagination-area">
                                    {{$branches->links()}}
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
