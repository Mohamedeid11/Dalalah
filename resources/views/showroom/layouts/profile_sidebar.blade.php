<div class="user-profile-sidebar">

    <div class="user-profile-sidebar-top">
        <div class="user-profile-img">
            <img src="{{ auth('showroom')->user()->getLogo() }}" style="width:100px;height:100px" alt="">
            <input type="file" class="profile-img-file">
        </div>
        <h5>{{ auth('showroom')->user()->showroom_name  }}</h5>
        <p>{{ auth('showroom')->user()->email }}</p>
        <span class="badge bg-secondary"> {{ auth('showroom')->user()->package?->name }} </span>
        <br>
        <span class="badge bg-danger"> {{TranslationHelper::translate('expired' ,'site' )}} : {{ auth('showroom')->user()->getExpiredDate() }} </span>
    </div>

    <ul class="user-profile-sidebar-list">
        <li><a class="{{ Request::is(app()->getLocale() .'/showroom/profile/dashboard') ? 'active' : '' }}" href="{{ route('showroom.dashboard') }}"><i class="far fa-gauge-high"></i> {{TranslationHelper::translate('dashboard' ,'site' )}} </a></li>
        <li><a class="{{ Request::is(app()->getLocale() .'/showroom/profile') ? 'active' : '' }}" href="{{ route('showroom.profile.index') }}"><i class="far fa-user"></i> {{TranslationHelper::translate('my_profile' ,'site' )}} </a></li>
        <li><a class="{{ Request::is(app()->getLocale() .'/showroom/profile/change-password') ? 'active' : '' }}" href="{{ route('showroom.change.password.view') }}"><i class="far fa-key"></i> {{TranslationHelper::translate('change_password' ,'site' )}} </a></li>
        <li><a class="{{ Request::is(app()->getLocale() .'/showroom/profile/addlist') ? 'active' : '' }}" href="{{ route('showroom.profile.addlist') }}"><i class="far fa-plus-circle"></i> {{TranslationHelper::translate('add_listing' ,'site' )}} </a></li>
        @if (auth('showroom')->user()->type == 'showroom')
            <li><a class="{{ Request::is(app()->getLocale() .'/showroom/profile/cars?status=new') ? 'active' : '' }}" href="{{ route('showroom.profile.cars','status=new') }}"><i class="far fa-car"></i> {{TranslationHelper::translate('new_cars' ,'site' )}} </a></li>
            <li><a class="{{ Request::is(app()->getLocale() .'/showroom/profile/cars?status=used') ? 'active' : '' }}" href="{{ route('showroom.profile.cars','status=used') }}"><i class="far fa-car"></i> {{TranslationHelper::translate('used_cars' ,'site' )}} </a></li>
        @endif
        <li><a class="{{ Request::is(app()->getLocale() .'/showroom/profile/branches') ? 'active' : '' }}" href="{{ route('showroom.profile.branches') }}"><i class="fas fa-location"></i> {{TranslationHelper::translate('branches' ,'site' )}} </a></li>
        <li>
            <a href="#\" onclick="event.preventDefault();
                document.getElementById('logout-enduser-form').submit();">
                <i class="far fa-sign-out"></i> {{TranslationHelper::translate('logout' ,'site' )}} </a>

            <form id="logout-enduser-form" action="{{ route('showroom.logout') }}" method="POST" class="d-none">
                @csrf
            </form>
        </li>
    </ul>

</div>
