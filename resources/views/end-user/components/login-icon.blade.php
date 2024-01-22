@if(auth('end-user')->check())
    <div class="nav-right-account">
        <div class="dropdown">
            <div data-bs-toggle="dropdown" aria-expanded="false">
                <img src="{{auth('end-user')->user()->getLogo()}}" alt="">
            </div>
            <ul class="dropdown-menu dropdown-menu-end">
                <li><a class="dropdown-item" href="{{ route('end-user.profile.dashboard') }}"><i class="far fa-gauge-high"></i>
                    {{TranslationHelper::translate('dashboard' ,'site' )}} </a></li>
                <li>
                    <a class="dropdown-item" onclick="event.preventDefault();
                                        document.getElementById('logout-enduser-form').submit();"><i class="far fa-sign-out"></i>
                    {{TranslationHelper::translate('log_out' ,'site' )}} </a>

                    <form id="logout-enduser-form" action="{{ route('end-user.logout') }}" method="POST" class="d-none">
                        @csrf
                    </form>
                </li>
            </ul>
        </div>
    </div>
@elseif(auth('showroom')->check())
    <div class="nav-right-account">
        <div class="dropdown">
            <div data-bs-toggle="dropdown" aria-expanded="false">
                <img src="{{auth('showroom')->user()->getLogo()}}" alt="">
            </div>
            <ul class="dropdown-menu dropdown-menu-end">
                <li><a class="dropdown-item" href="{{ route('showroom.dashboard') }}"><i class="far fa-gauge-high"></i> 
                    {{TranslationHelper::translate('dashboard' ,'site' )}} </a></li>
                <li>
                    <a class="dropdown-item" onclick="event.preventDefault();
                                        document.getElementById('logout-enduser-form').submit();"><i class="far fa-sign-out"></i>
                        {{TranslationHelper::translate('log_out' ,'site' )}} </a>
                    <form id="logout-enduser-form" action="{{ route('showroom.logout') }}" method="POST" class="d-none">
                        @csrf
                    </form>
                </li>
            </ul>
        </div>
    </div>
@endif
