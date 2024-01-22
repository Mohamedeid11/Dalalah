@extends('end-user.layouts.app')

@push('styles')
    <link rel="stylesheet" href="{{ asset('end-user/assets/css/form-steps.css') }}">
@endpush

@section('content')

<main class="main">

    <!-- breadcrumb -->
    <div class="site-breadcrumb" style="background: url('{{asset('end-user/assets/img/breadcrumb/01.png')}}')">
        <div class="container">
            <h2 class="breadcrumb-title">Track Your Order</h2>
            <ul class="breadcrumb-menu">
                <li><a href="{{  route('end-user.index') }}">Home</a></li>
                <li class="active">Track Your Order</li>
            </ul>
        </div>
    </div>
    <!-- breadcrumb end -->

    <div class="container">
        <div class="wrapper">
            <form action="{{ route('end-user.track.order.check') }}" method="POST" class="form-control" id="track-order">
                @csrf

                <div class="form_container my-4">
                    <label>Track Your Order Enter Phone</label>
                    <input type="text" name="phone" class="form-control">
                    <span class="text-danger clear" id="phone"></span>
                </div>

                <button id="btn-done" class="btn btn-success text-center mx-auto">Send</button>
            </form>
        </div>
    </div>
    {{-- </div> --}}
</main>

@endsection

@push('scripts')

<script>
    $('#track-order').submit(function(e) {
        e.preventDefault();

        $('.clear').text(' ');
        const action = $('#track-order').attr("action");
        let formData = new FormData($('#track-order')[0]);

        $.ajax({
            url: action
            , data: formData
            , type: 'POST'
            , processData: false
            , contentType: false
            , cache: false
            , beforeSend: function() {
                //
            }
            , success: function(res) {
                $('#track-order')[0].reset();
                Swal.fire(res.data)
            }
            , complete: function(data) {
                //
            }
            , error: function(reject) {
                let res = $.parseJSON(reject.responseText);
                $("#phone").text(res.message);
            }
        });
    });
</script>

@endpush
