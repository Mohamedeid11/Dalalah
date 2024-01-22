<!DOCTYPE html>
<html lang="en">

<head>

    <!-- meta tags -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <!-- title -->
    <title> Dalala </title>

    <!-- Meta Pixel Code -->
    <script>
        ! function(f, b, e, v, n, t, s) {
            if (f.fbq) return;
            n = f.fbq = function() {
                n.callMethod ?
                    n.callMethod.apply(n, arguments) : n.queue.push(arguments)
            };
            if (!f._fbq) f._fbq = n;
            n.push = n;
            n.loaded = !0;
            n.version = '2.0';
            n.queue = [];
            t = b.createElement(e);
            t.async = !0;
            t.src = v;
            s = b.getElementsByTagName(e)[0];
            s.parentNode.insertBefore(t, s)
        }(window, document, 'script'
            , 'https://connect.facebook.net/en_US/fbevents.js');
        fbq('init', '273795352235607');
        fbq('track', 'PageView');

    </script>
    <noscript><img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=273795352235607&ev=PageView&noscript=1" /></noscript>
    <!-- End Meta Pixel Code -->

    <!-- favicon -->
    <link rel="icon" type="image/x-icon" href="{{ asset('end-user/assets/img/logo/Favicon.png') }}">
    <!-- css -->
    <link rel="stylesheet" href="{{ asset('end-user/assets/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('end-user/assets/css/all-fontawesome.min.css') }}">
    <link rel="stylesheet" href="{{ asset('end-user/assets/css/flaticon.css') }}">
    <link rel="stylesheet" href="{{ asset('end-user/assets/css/animate.min.css') }}">
    <link href="{{ asset('end-user/assets/css/jquery.fancybox.min.css')}}" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('end-user/assets/css/magnific-popup.min.css') }}">
    <link rel="stylesheet" href="{{ asset('end-user/assets/css/owl.carousel.min.css') }}">
    <link rel="stylesheet" href="{{ asset('end-user/assets/css/jquery-ui.min.css') }}">
    <link rel="stylesheet" href="{{ asset('end-user/assets/css/nice-select.min.css') }}">
    <link rel="stylesheet" href="{{ asset('end-user/assets/css/style.css') }}">
    @if(app()->getLocale() == 'ar')
    <link rel="stylesheet" href="{{ asset('end-user/assets/css/style_ar.css') }}">
    @endif
    <link rel="stylesheet" href="{{ asset('end-user/assets/css/custom.css') }}">
    <link rel="stylesheet" href="{{ asset('end-user/assets/css/custom_black_theme.css') }}">
    <link rel="stylesheet" href="{{ asset('end-user/assets/css/dropFile.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Dropify/0.2.2/css/dropify.css" integrity="sha512-In/+MILhf6UMDJU4ZhDL0R0fEpsp4D3Le23m6+ujDWXwl3whwpucJG1PEmI3B07nyJx+875ccs+yX2CqQJUxUw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    @stack('styles')
    @livewireStyles

</head>

<body>

    <!-- preloader -->
    <div class="preloader">
        <div class="loader-ripple">
            <div></div>
            <div></div>
        </div>
    </div>
    <!-- preloader end -->

    @include('end-user.layouts.header')

    @yield('content')

    @include('end-user.layouts.sidebar')
    @include('end-user.layouts.footer')

    <!-- scroll-top -->
    <a href="#" id="scroll-top"><i class="far fa-arrow-up"></i></a>
    <!-- scroll-top end -->

    <!-- js -->
    <script src="{{ asset('end-user/assets/js/jquery-3.6.0.min.js') }}"></script>
    <script src="{{ asset('end-user/assets/js/modernizr.min.js') }}"></script>
    <script src="{{ asset('end-user/assets/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('end-user/assets/js/jquery.fancybox.js')}}"></script>
    <script src="{{ asset('end-user/assets/js/imagesloaded.pkgd.min.js') }}"></script>
    <script src="{{ asset('end-user/assets/js/jquery.magnific-popup.min.js') }}"></script>
    <script src="{{ asset('end-user/assets/js/isotope.pkgd.min.js') }}"></script>
    <script src="{{ asset('end-user/assets/js/jquery.appear.min.js') }}"></script>
    <script src="{{ asset('end-user/assets/js/jquery.easing.min.js') }}"></script>
    <script src="{{ asset('end-user/assets/js/owl.carousel.min.js') }}"></script>
    <script src="{{ asset('end-user/assets/js/counter-up.js') }}"></script>
    <script src="{{ asset('end-user/assets/js/jquery-ui.min.js') }}"></script>
    <script src="{{ asset('end-user/assets/js/jquery.nice-select.min.js') }}"></script>
    <script src="{{ asset('end-user/assets/js/wow.min.js') }}"></script>
    <script src="{{ asset('end-user/assets/js/sweetalert.js') }}"></script>
    <script src="{{ asset('dashboard/assets/js/jquery_validation.js') }}"></script>
    <script src="{{ asset('end-user/assets/js/addMultiFile.js') }}"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Dropify/0.2.2/js/dropify.min.js" integrity="sha512-8QFTrG0oeOiyWo/VM9Y8kgxdlCryqhIxVeRpWSezdRRAvarxVtwLnGroJgnVW9/XBRduxO/z1GblzPrMQoeuew==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    @stack('scripts')

    <script src="{{ asset('end-user/assets/js/main.js') }}"></script>
    @livewireScripts
    @include('end-user.layouts.alerts')
    @include('end-user.layouts.firebasescript')

</body>

</html>
