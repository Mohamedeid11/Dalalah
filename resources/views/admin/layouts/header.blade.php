<!--begin::Header-->
<div id="kt_header" style="" class="header align-items-stretch">
    <!--begin::Container-->
    <div class="container-fluid d-flex align-items-stretch justify-content-between">

        <!--begin::Aside mobile toggle-->
        <div class="d-flex align-items-center d-lg-none ms-n3 me-1" title="Show aside menu">
            <div class="btn btn-icon btn-active-light-primary w-30px h-30px w-md-40px h-md-40px" id="kt_aside_mobile_toggle">
                <!--begin::Svg Icon | path: icons/duotune/abstract/abs015.svg-->
                <span class="svg-icon svg-icon-2x mt-1">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                        <path d="M21 7H3C2.4 7 2 6.6 2 6V4C2 3.4 2.4 3 3 3H21C21.6 3 22 3.4 22 4V6C22 6.6 21.6 7 21 7Z" fill="black" />
                        <path opacity="0.3" d="M21 14H3C2.4 14 2 13.6 2 13V11C2 10.4 2.4 10 3 10H21C21.6 10 22 10.4 22 11V13C22 13.6 21.6 14 21 14ZM22 20V18C22 17.4 21.6 17 21 17H3C2.4 17 2 17.4 2 18V20C2 20.6 2.4 21 3 21H21C21.6 21 22 20.6 22 20Z" fill="black" />
                    </svg>
                </span>
                <!--end::Svg Icon-->
            </div>
        </div>
        <!--end::Aside mobile toggle-->

        <!--begin::Mobile logo-->
        <div class="d-flex align-items-center flex-grow-1 flex-lg-grow-0">
            <a href="#" class="d-lg-none">
                <img alt="Logo" src="{{ asset('end-user/images/logo.jfif') }}" class="h-30px" />
            </a>
        </div>
        <!--end::Mobile logo-->

        <!--begin::Wrapper-->
        <div class="d-flex align-items-stretch justify-content-between flex-lg-grow-1">
            <!--begin::Navbar-->
            <div class="d-flex align-items-stretch" id="kt_header_nav">

            </div>
            <!--end::Navbar-->
            <!--begin::Topbar-->
            <div class="d-flex align-items-stretch flex-shrink-0">
                <!--begin::Toolbar wrapper-->
                <div class="d-flex align-items-stretch flex-shrink-0">

                    <!--begin::Notifications-->
                    <div class="d-flex align-items-center ms-1 ms-lg-3">
                        <!--begin::Menu- wrapper-->
                        <div class="btn btn-icon btn-active-light-primary position-relative w-30px h-30px w-md-40px h-md-40px" data-kt-menu-trigger="click" data-kt-menu-attach="parent" data-kt-menu-placement="bottom-end" data-kt-menu-flip="bottom">
                            <!--begin::Svg Icon | path: icons/duotune/general/gen022.svg-->
                            <span class="svg-icon svg-icon-1">
                                <i class="fas fa-bell fa-2x"></i>
                            </span>
                            <!--end::Svg Icon-->
                            <span class="bullet bullet-dot bg-success h-6px w-6px position-absolute translate-middle top-0 start-50 animation-blink"></span>
                        </div>
                        <!--begin::Menu-->
                        <div class="menu menu-sub menu-sub-dropdown menu-column w-350px w-lg-375px" data-kt-menu="true">
                            <!--begin::Heading-->
                            <!--end::Heading-->
                            <!--begin::Tab content-->
                            <div class="tab-content">
                                <!--begin::Tab panel-->
                                <div class="tab-pane fade show active" id="kt_topbar_notifications_1" role="tabpanel">
                                    <!--begin::Items-->
                                    <div class="scroll-y mh-325px my-5 px-8">
                                        @if(count(app('notifications')))
                                        @foreach (app('notifications') as $notification)
                                            <!--begin::Item-->
                                            <div class="d-flex flex-stack py-4">
                                                <!--begin::Section-->
                                                <div class="d-flex align-items-center">
                                                    <!--begin::Title-->
                                                    <div class="mb-0 me-2">
                                                        @if($notification->type    == 'App\Notifications\RequestCarUserNotification')
                                                            <a href="{{ route('admin.requests.index') }}" class="fs-6 text-gray-800 text-hover-primary fw-bolder">{{ $notification->getTitle() }}</a>
                                                        @else
                                                        {{-- @elseif($notification->type == 'App\Notifications\CarStatusSoldNotification') --}}
                                                            <a href="{{ route('admin.car.show',$notification->getNavigateId()) }}" class="fs-6 text-gray-800 text-hover-primary fw-bolder">{{ $notification->getTitle() }}</a>
                                                        @endif
                                                        <div class="text-gray-400 fs-7">{{ $notification->getMessage() }}</div>
                                                    </div>
                                                    <!--end::Title-->
                                                </div>
                                                <!--end::Section-->
                                                <!--begin::Label-->
                                                <span class="badge badge-light fs-8">{{ $notification->getAgo() }}</span>
                                                <!--end::Label-->
                                            </div>
                                            <!--end::Item-->
                                        @endforeach
                                        @else
                                            <p class="text-danger text-center mx-auto"> {{ __('No Notification Found') }} </p>
                                        @endif
                                    </div>
                                    <!--end::Items-->
                                    <!--begin::View more-->
                                    {{-- <div class="py-3 text-center border-top">
                                        <a href="#\" class="btn btn-color-gray-600 btn-active-color-primary">View All
                                            <!--begin::Svg Icon | path: icons/duotune/arrows/arr064.svg-->
                                            <span class="svg-icon svg-icon-5">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                                                    <rect opacity="0.5" x="18" y="13" width="13" height="2" rx="1" transform="rotate(-180 18 13)" fill="black" />
                                                    <path d="M15.4343 12.5657L11.25 16.75C10.8358 17.1642 10.8358 17.8358 11.25 18.25C11.6642 18.6642 12.3358 18.6642 12.75 18.25L18.2929 12.7071C18.6834 12.3166 18.6834 11.6834 18.2929 11.2929L12.75 5.75C12.3358 5.33579 11.6642 5.33579 11.25 5.75C10.8358 6.16421 10.8358 6.83579 11.25 7.25L15.4343 11.4343C15.7467 11.7467 15.7467 12.2533 15.4343 12.5657Z" fill="black" />
                                                </svg>
                                            </span>
                                            <!--end::Svg Icon--></a>
                                    </div> --}}
                                    <!--end::View more-->
                                </div>
                                <!--end::Tab panel-->
                            </div>
                            <!--end::Tab content-->
                        </div>
                        <!--end::Menu-->
                        <!--end::Menu wrapper-->
                    </div>
                    <!--end::Notifications-->

                    <!--begin::User-->
                    <div class="d-flex align-items-center ms-1 ms-lg-3" id="kt_header_user_menu_toggle">
                        <!--begin::Menu wrapper-->
                        <div class="cursor-pointer symbol symbol-30px symbol-md-40px" data-kt-menu-trigger="click" data-kt-menu-attach="parent" data-kt-menu-placement="bottom-end" data-kt-menu-flip="bottom">
                            <img src="{{ asset('dashboard/assets/img/user.png') }}" alt="metronic" />
                        </div>
                        <!--begin::Menu-->
                        <div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg menu-state-primary fw-bold py-4 fs-6 w-275px" data-kt-menu="true">
                            <!--begin::Menu item-->
                            <div class="menu-item px-3">
                                <div class="menu-content d-flex align-items-center px-3">
                                    <!--begin::Avatar-->
                                    <div class="symbol symbol-50px me-5">
                                        <img alt="Logo" src="{{ asset('dashboard/assets/img/user.png') }}" />
                                    </div>
                                    <!--end::Avatar-->
                                    <!--begin::Username-->
                                    <div class="d-flex flex-column">
                                        <div class="fw-bolder d-flex align-items-center fs-5">{{ auth('admin')->user()->name }}
                                            {{-- <span class="badge badge-light-success fw-bolder fs-8 px-2 py-1 ms-2">Pro</span> --}}
                                        </div>
                                        <a href="#" class="fw-bold text-muted text-hover-primary fs-7">{{ auth('admin')->user()->email }}</a>
                                    </div>
                                    <!--end::Username-->
                                </div>
                            </div>
                            <!--end::Menu item-->
                            <!--begin::Menu separator-->
                            <div class="separator my-2"></div>
                            <!--end::Menu separator-->
                            <!--begin::Menu item-->
                            {{-- <div class="menu-item px-5">
                                <a href="#" class="menu-link px-5">My Profile</a>
                            </div> --}}
                            <!--end::Menu item-->


                            <!--begin::Menu separator-->
                            <div class="separator my-2"></div>
                            <!--end::Menu separator-->
                            <!--begin::Menu item-->
                            {{-- <div class="menu-item px-5" data-kt-menu-trigger="hover" data-kt-menu-placement="left-start" data-kt-menu-flip="bottom, top">
                                <a href="#" class="menu-link px-5">
                                    <span class="menu-title position-relative">Language
                                        <span class="fs-8 rounded bg-light px-3 py-2 position-absolute translate-middle-y top-50 end-0">English
                                            <img class="w-15px h-15px rounded-1 ms-2" src="assets/media/flags/united-states.svg" alt="" /></span></span>
                                </a>
                                <!--begin::Menu sub-->
                                <div class="menu-sub menu-sub-dropdown w-175px py-4">
                                    <!--begin::Menu item-->
                                    <div class="menu-item px-3">
                                        <a href="../../demo1/dist/account/settings.html" class="menu-link d-flex px-5 active">
                                            <span class="symbol symbol-20px me-4">
                                                <img class="rounded-1" src="assets/media/flags/united-states.svg" alt="" />
                                            </span>English</a>
                                    </div>
                                    <!--end::Menu item-->
                                    <!--begin::Menu item-->
                                    <div class="menu-item px-3">
                                        <a href="../../demo1/dist/account/settings.html" class="menu-link d-flex px-5">
                                            <span class="symbol symbol-20px me-4">
                                                <img class="rounded-1" src="assets/media/flags/spain.svg" alt="" />
                                            </span>Arabic</a>
                                    </div>
                                    <!--end::Menu item-->
                                </div>
                                <!--end::Menu sub-->
                            </div> --}}
                            <!--end::Menu item-->

                            <!--begin::Menu item-->
                            <div class="menu-item px-5">
                                <a class="menu-link px-5" href="{{ route('admin.logout') }}" onclick="event.preventDefault();
                                                    document.getElementById('logout-form').submit();">
                                    Sign Out
                                </a>

                                <form id="logout-form" action="{{ route('admin.logout') }}" method="POST" class="d-none">
                                    @csrf
                                </form>
                            </div>
                            <!--end::Menu item-->

                            <!--begin::Menu separator-->
                            <div class="separator my-2"></div>
                            <!--end::Menu separator-->

                        </div>
                        <!--end::Menu-->
                        <!--end::Menu wrapper-->
                    </div>
                    <!--end::User -->
                    <!--begin::Heaeder menu toggle-->
                    <div class="d-flex align-items-center d-lg-none ms-2 me-n3" title="Show header menu">
                        <div class="btn btn-icon btn-active-light-primary w-30px h-30px w-md-40px h-md-40px" id="kt_header_menu_mobile_toggle">
                            <!--begin::Svg Icon | path: icons/duotune/text/txt001.svg-->
                            <span class="svg-icon svg-icon-1">
                                {{-- <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                                    <path d="M13 11H3C2.4 11 2 10.6 2 10V9C2 8.4 2.4 8 3 8H13C13.6 8 14 8.4 14 9V10C14 10.6 13.6 11 13 11ZM22 5V4C22 3.4 21.6 3 21 3H3C2.4 3 2 3.4 2 4V5C2 5.6 2.4 6 3 6H21C21.6 6 22 5.6 22 5Z" fill="black" />
                                    <path opacity="0.3" d="M21 16H3C2.4 16 2 15.6 2 15V14C2 13.4 2.4 13 3 13H21C21.6 13 22 13.4 22 14V15C22 15.6 21.6 16 21 16ZM14 20V19C14 18.4 13.6 18 13 18H3C2.4 18 2 18.4 2 19V20C2 20.6 2.4 21 3 21H13C13.6 21 14 20.6 14 20Z" fill="black" />
                                </svg> --}}
                                <i class="fas fa-bell"></i>
                            </span>
                            <!--end::Svg Icon-->
                        </div>
                    </div>
                    <!--end::Heaeder menu toggle-->
                </div>
                <!--end::Toolbar wrapper-->
            </div>
            <!--end::Topbar-->
        </div>
        <!--end::Wrapper-->

    </div>
    <!--end::Container-->
</div>
<!--end::Header-->
