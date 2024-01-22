<div class="user-profile-sidebar">

    <div class="user-profile-sidebar-top">
        <div class="user-profile-img">
            <img src="{{ getActiveUserName()['logo'] }}" style="width:100px;height:100px" alt="">
            <input type="file" class="profile-img-file">
        </div>
        <h5>{{ getActiveUserName()['name'] }}</h5>
        <p>{{ getActiveUserName()['email'] }}</p>
    </div>

    <ul class="user-profile-sidebar-list">
        <li><a class="{{ Request::is(app()->getLocale() .'/profile/dashboard') ? 'active' : '' }}" href="{{ route('end-user.profile.dashboard') }}"><i class="far fa-gauge-high"></i> {{TranslationHelper::translate('dashboard' ,'site' )}} </a></li>
        <li><a class="{{ Request::is(app()->getLocale() .'/profile') ? 'active' : '' }}" href="{{ route('end-user.profile.index') }}"><i class="far fa-user"></i> {{TranslationHelper::translate('my_profile' ,'site' )}} </a></li>
        <li><a class="{{ Request::is(app()->getLocale() .'/profile/change-password') ? 'active' : '' }}" href="{{ route('end-user.change.password.view') }}"><i class="far fa-key"></i> {{TranslationHelper::translate('change_password' ,'site' )}} </a></li>
        <li><a class="{{ Request::is(app()->getLocale() .'/profile/addlist') ? 'active' : '' }}" href="{{ route('end-user.profile.addlist') }}"><i class="far fa-plus-circle"></i> {{TranslationHelper::translate('add_listing' ,'site' )}} </a></li>
        <li><a class="{{ Request::is(app()->getLocale() .'/profile/favorite') ? 'active' : '' }}" href="{{ route('end-user.profile.favorite') }}"><i class="far fa-heart"></i> {{TranslationHelper::translate('my_favorites' ,'site' )}} </a></li>
        <li>
            <a href="#\" onclick="event.preventDefault();
            document.getElementById('logout-enduser-form').submit();"><i class="far fa-sign-out"></i> {{TranslationHelper::translate('logout' ,'site' )}} </a>

            <form id="logout-enduser-form" action="{{ route('end-user.logout') }}" method="POST" class="d-none">
                @csrf
            </form>
        </li>
    </ul>

</div>
