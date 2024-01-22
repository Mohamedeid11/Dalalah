<!-- footer area -->
<footer class="footer-area">

    <div class="footer-widget">
        <div class="container">
            <div class="row footer-widget-wrapper pt-100 pb-70">
                <div class="col-md-6 col-lg-4">
                    <div class="footer-widget-box about-us">
                        <a href="#" class="footer-logo">
                            <img src="{{ setting('site_logo') }}" alt="" loading="lazy" style="background: #fff">
                        </a>
                        <p class="mb-3">
                            {{ setting('about_footer_content') }}
                        </p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-2">
                    <div class="footer-widget-box list">
                        <h4 class="footer-widget-title"> {{TranslationHelper::translate('quick_links' ,'site' )}} </h4>
                        <ul class="footer-list">
                            <li><a href="{{ route('end-user.page.show' , 'slug=about-us') }}"><i class="fas fa-caret-right"></i> {{TranslationHelper::translate('about_us' ,'site' )}} </a></li>
                            <li><a href="{{ route('end-user.page.show' , 'slug=terms-and-conditions') }}"><i class="fas fa-caret-right"></i> {{TranslationHelper::translate('terms_of_service' ,'site' )}} </a></li>
                            <li><a href="{{ route('end-user.page.show' , 'slug=privacy-policy') }}"><i class="fas fa-caret-right"></i> {{TranslationHelper::translate('privacy_policy' ,'site' )}} </a></li>
                            <li><a href="{{ route('end-user.page.show' , 'slug=buying-and-selling-policy') }}"><i class="fas fa-caret-right"></i> {{TranslationHelper::translate('buying_and_selling_policy' ,'site' )}} </a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="footer-widget-box list">
                        <h4 class="footer-widget-title"> {{TranslationHelper::translate('support_center' ,'site' )}} </h4>
                        <ul class="footer-list">
                            <li><a href="#"><i class="fas fa-caret-right"></i> {{TranslationHelper::translate('Faq' ,'site' )}} </a></li>
                            <li><a href="#"><i class="fas fa-caret-right"></i> {{TranslationHelper::translate('sell_vehicles' ,'site' )}} </a></li>
                            <li><a href="{{ route('end-user.contact.index') }}"><i class="fas fa-caret-right"></i> {{TranslationHelper::translate('contact_us' ,'site' )}} </a></li>
                            <li><a href="#"><i class="fas fa-caret-right"></i> {{TranslationHelper::translate('our_showroom' ,'site' )}} </a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="footer-widget-box list">
                        <h4 class="footer-widget-title"> {{TranslationHelper::translate('contact' ,'site' )}} </h4>
                        <div class="footer-newsletter">
                            <ul class="footer-contact">
                                <li>
                                    <a class="row" href="tel:{{ setting('phone','en') }}">
                                        <p class="col-3"> <i class="far fa-phone "></i> </p>
                                        <p class="col-9"> {{ setting('phone','en') }} </p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#\"  class="row">
                                        <p class="col-3">  <i class="far fa-map-marker-alt"></i> </p>
                                        <p class="col-9">  {{ setting('address') }} </p>
                                    </a>
                                </li>
                                <li><a href="mailto:{{ setting('email','en') }}"  class="row">
                                        <p class="col-3">   <i class="far fa-envelope "></i> </p>
                                        <p class="col-9">  {{ setting('email','en') }} </p>
                                </a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="copyright">
        <div class="container">
            <div class="row">
                <div class="col-md-6 align-self-center">
                    <p class="copyright-text">
                        {{TranslationHelper::translate('designed_&_developed_by_matrix_cloud' ,'site' )}}
                    </p>
                </div>
                <div class="col-md-6 align-self-center">
                    <ul class="footer-social">
                        @foreach (socialMedia() as $key => $social)
                        @if($social)
                        <li><a href="{{ $social }}"><i class="fab fa-{{ $key }}"></i></a></li>
                        @endif
                        @endforeach
                    </ul>
                </div>
            </div>
        </div>
    </div>

</footer>
<!-- footer area end -->
