@extends('end-user.layouts.app')

@section('content')


<main class="main">

    <!-- breadcrumb -->
    <div class="site-breadcrumb" style="background: url({{ asset('end-user/assets/img/logo/logo-nav.png') }})">
        <div class="container">
            <h2 class="breadcrumb-title">Contact Us</h2>
            <ul class="breadcrumb-menu">
                <li><a href="index.html">Home</a></li>
                <li class="active">Contact Us</li>
            </ul>
        </div>
    </div>
    <!-- breadcrumb end -->


    <!-- contact area -->
    <div class="contact-area py-120">
        <div class="container">
            <div class="contact-content">
                <div class="row">

                    <div class="col-md-4">
                        <div class="contact-info">
                            <div class="contact-info-icon">
                                <i class="fal fa-map-location-dot"></i>
                            </div>
                            <div class="contact-info-content">
                                <h5>Address</h5>
                                <p>{{ setting('address') }}</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="contact-info">
                            <div class="contact-info-icon">
                                <i class="fal fa-phone-volume"></i>
                            </div>
                            <div class="contact-info-content">
                                <h5>Call Us</h5>
                                <p>{{ setting('phone','en') }}</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="contact-info">
                            <div class="contact-info-icon">
                                <i class="fal fa-envelopes"></i>
                            </div>
                            <div class="contact-info-content">
                                <h5>Email Us</h5>
                                <p>{{ setting('email','en') }}</p>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="contact-wrapper">
                <div class="row">
                    <div class="col-lg-12 align-self-center">
                        <div class="contact-form">

                            <div class="contact-form-header">
                                <h2>Get In Touch</h2>
                            </div>

                            <form method="post" action="{{ route('end-user.contact.store') }}" id="contact">
                                @csrf

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="name" placeholder="Your Name" required>
                                            <span class="text-danger clear" id="name"></span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="email" class="form-control" name="email" placeholder="Your Email" required>
                                            <span class="text-danger clear" id="email"></span>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="number" class="form-control" name="phone" placeholder="Your Phone" required>
                                            <span class="text-danger clear" id="phone"></span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="subject" placeholder="Your Subject" required>
                                            <span class="text-danger clear" id="subject"></span>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <textarea name="content" cols="30" rows="5" class="form-control" placeholder="Write Your Message" required></textarea>
                                    <span class="text-danger clear" id="content"></span>
                                </div>

                                <button type="submit" class="theme-btn">
                                    Send Message <i class="far fa-paper-plane"></i>
                                </button>

                                <div class="col-md-12 mt-3">
                                    <div class="form-messege text-success"></div>
                                </div>

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end contact area -->

</main>

@endsection

@push('scripts')

<script>
    $('#contact').submit(function(e) {
        e.preventDefault();

        $('.clear').text(' ');

        const action = $(this).attr("action");
        let formData = new FormData($(this)[0]);

        $.ajax({
            url: action
            , data: formData
            , type: 'POST'
            , processData: false
            , contentType: false
            , cache: false
            , success: function(res) {
                $('#contact')[0].reset();
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: 'Message Send Successfully',
                    showConfirmButton: false,
                    timer: 1500
                });
            }
            , error: function(reject) {
                let res = $.parseJSON(reject.responseText);
                console.log(res.errors);
                $.each(res.errors, function(key, value) {
                    $("#" + key).text(value[0]);
                });
            }
        });
    });

</script>

@endpush
