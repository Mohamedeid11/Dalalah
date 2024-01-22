 <!-- header area -->
 <header class="header">
     <div class="main-navigation">
         <nav class="navbar navbar-expand-lg">
             <div class="container position-relative">
                 <a class="navbar-brand" href="{{ route('end-user.index') }}">
                     <img loading="lazy" src="{{ asset('end-user/assets/img/logo/logo-nav.png') }}" alt="logo">
                 </a>
                 <div class="mobile-menu-right">
                     <div class="sider-btn">
                         <div class="btn-group">
                            @foreach (config('language') as $key => $lang)
                                @if(app()->getLocale() != $key)
                                    <a href="{{ LaravelLocalization::getLocalizedURL($key) }}" class="lang-site"> {{ $key }} </a> <span class="mx-1"><i class="far fa-globe"></i></span>
                                @endif
                            @endforeach
                         </div>
                     </div>
                     <div class="search-btn">
                         <button type="button" class="nav-right-link"><i class="far fa-search"></i></button>
                     </div>
                     <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#main_nav" aria-expanded="false" aria-label="Toggle navigation">
                         <span class="navbar-toggler-mobile-icon"><i class="far fa-bars"></i></span>
                     </button>
                 </div>
                 <div class="collapse navbar-collapse" id="main_nav">
                     <ul class="navbar-nav">

                         <li class="nav-item">
                             <a class="nav-link {{ Request::is('/') ? 'active' : '' }} " href="{{ route('end-user.index') }}">{{TranslationHelper::translate('home' ,'site' )}}</a>
                         </li>

                         <li class="nav-item dropdown">
                             <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">{{TranslationHelper::translate('used_cars' ,'site' )}} </a>
                             <ul class="dropdown-menu fade-down">
                                 <li><a class="dropdown-item" href="{{ route('end-user.cars.index','model_role=showroom&status=used') }}">{{TranslationHelper::translate('showrooms' ,'site' )}}</a></li>
                                 <li><a class="dropdown-item" href="{{ route('end-user.cars.index','model_role=user') }}">{{TranslationHelper::translate('users' ,'site' )}}</a></li>
                             </ul>
                         </li>

                         <li class="nav-item dropdown">
                             <a class="nav-link dropdown-toggle {{ Request::is('cars/*') ? 'active' : '' }}" href="#" data-bs-toggle="dropdown">{{TranslationHelper::translate('new_cars' ,'site' )}}</a>
                             <ul class="dropdown-menu fade-down">
                                 <li><a class="dropdown-item" href="{{ route('end-user.cars.index','model_role=agency') }}">{{TranslationHelper::translate('agencies' ,'site' )}} </a></li>
                                 <li><a class="dropdown-item" href="{{ route('end-user.cars.index','model_role=showroom&status=new') }}">{{TranslationHelper::translate('showrooms' ,'site' )}}</a></li>
                             </ul>
                         </li>

                         <li class="nav-item">
                             <a class="nav-link" href="{{ route('end-user.cars.index','model_role=admin') }}">{{TranslationHelper::translate('automobile_cars' ,'site' )}} </a>
                         </li>

                         @unless (auth('end-user')->check() || auth('showroom')->check())
                            <li class="nav-item">
                                <a href="{{ route('end-user.login') }}" class="btn btn-outline-light" style="padding: 5px 15px;margin:30px 20px 0 0;"><i class="far fa-arrow-right-to-arc"></i> {{TranslationHelper::translate('login' ,'site' )}}</a>
                            </li>
                         @endunless

                     </ul>
                     <div class="d-md-none d-block">
                         <div class="sidebar-btn">
                             <a href="#" class="mx-2"><i class="far fa-arrow-right-to-arc"></i>{{TranslationHelper::translate('login' ,'site' )}} </a>
                             {{-- <br> <a href="#"><i class="far fa-user-vneck"></i> Register</a>  --}}
                         </div>
                         <div class=" mt-2">
                             <a href="{{ route('end-user.sell.form')}}" class="theme-btn">
                                 {{TranslationHelper::translate('sell_trade_your_car' ,'site' )}}
                             </a>
                         </div>
                     </div>

                     <div class="nav-right">

                        <x-login-icon />

                         <div class="nav-right-btn mt-2">
                             <a href="{{ route('end-user.sell.form')}}" class="btn btn-outline-danger">
                                 {{TranslationHelper::translate('sell_trade_your_car' ,'site' )}}
                             </a>
                         </div>

                         <div class="sider-btn">
                             <div class="btn-group">
                                 @foreach (config('language') as $key => $lang)
                                 @if(app()->getLocale() != $key)
                                 <a href="{{ LaravelLocalization::getLocalizedURL($key) }}" class="lang-site"> {{ $lang }} </a>
                                 <span class="mx-1"><i class="far fa-globe"></i></span>
                                 @endif
                                 @endforeach
                             </div>
                         </div>

                         <div class="sidebar-btn">
                             <button type="button" class="nav-right-link"><i class="far fa-bars-sort"></i></button>
                         </div>

                     </div>
                 </div>
                 <!-- search area -->
                 <div class="search-area">
                     <form action="#">
                         <div class="form-group">
                             <input type="text" class="form-control" placeholder=" {{TranslationHelper::translate('type_keyword' ,'site' )}}">
                             <button type="submit" class="search-icon-btn"><i class="far fa-search"></i></button>
                         </div>
                     </form>
                 </div>
                 <!-- search area end -->
             </div>
         </nav>
     </div>
 </header>
 <!-- header area end -->
