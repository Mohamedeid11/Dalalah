  <!-- sidebar-popup -->
  <div class="sidebar-popup">
      <div class="sidebar-wrapper">
          <div class="sidebar-content">
              {{-- <button type="button" class="close-sidebar-popup"><i class="far fa-xmark"></i></button> --}}

              <div class="logo text-center">
                  <img loading="lazy" src="{{ asset('end-user/assets/img/logo/logo-nav.png') }}" style="height:100px" alt="logo">
              </div>

              <div class="nav-right-btn mt-2"></div>
              <div class="row mt-3 px-2 py-3 align-items-center" style="background: #fff ;  box-shadow: 1px 7px 5px 5px #ccc;">
                  <div class="col-7"><a href="{{ route('end-user.sell.form')}}" class="btn btn-outline-danger">
                        {{TranslationHelper::translate('sell_trade_your_car' ,'site' )}} </a>
                  </div>
                  <div class="col-5 text-end">
                      <div class="btn-group">
                        @foreach (config('language') as $key => $lang)
                            @if(app()->getLocale() != $key)
                                <a href="{{ LaravelLocalization::getLocalizedURL($key) }}"> {{ $lang }} </a>
                                <span class="mx-1"><i class="far fa-globe"></i></span>
                            @endif
                        @endforeach
                      </div>
                  </div>
              </div>
              <div class="sidebar-about">
                  <a href="" class="d-block">
                      <p class="mb-2"> <span class="me-3"><i class="fas fa-car icon-sidebar"></i></span> {{TranslationHelper::translate('new_cars' ,'site' )}} </p>
                  </a>
                  <a href="" class="d-block">
                      <p class="mb-2"> <span class="me-3"><i class="fas fa-car icon-sidebar"></i></span> {{TranslationHelper::translate('used_cars' ,'site' )}} </p>
                  </a>
                  <a href="" class="d-block">
                      <p class="mb-2"> <span class="me-3"><i class="fas fa-car icon-sidebar"></i></span> {{TranslationHelper::translate('automobile_cars' ,'site' )}} </p>
                  </a>
                  <a href="{{ route('end-user.track.order') }}" class="d-block">
                      <p class="mb-2"> <span class="me-3"><i class="fas fa-map-marker-minus icon-sidebar"></i></span> {{TranslationHelper::translate('track_your_order_no' ,'site' )}} .</p>
                  </a>
                  <a href="" class="d-block">
                      <p class="mb-2"> <span class="me-3"><i class="fas fa-cars icon-sidebar"></i></span> {{TranslationHelper::translate('sell_trade_your_car' ,'site' )}} </p>
                  </a>
                  @unless (auth('end-user')->check() || auth('showroom')->check())
                    <a href="{{ route('showroom.login') }}" class="d-block">
                        <p class="mb-2"> <span class="me-3"><i class="fas fa-id-card icon-sidebar"></i></span> {{TranslationHelper::translate('login_showrooms_agencies' ,'site' )}} </p>
                    </a>
                  @endunless
                  <hr>
              </div>
              <div class="sidebar-contact">
                  <a href="" class="d-block">
                      <p class="mb-2"> <span class="me-3"><i class="fas fa-car-building icon-sidebar"></i></span> {{TranslationHelper::translate('showrooms' ,'site' )}} </p>
                  </a>
                  <hr>
                  <a href="" class="d-block">
                      <p class="mb-2"> <span class="me-3"><i class="fas fa-car-building icon-sidebar"></i></span> {{TranslationHelper::translate('agencies' ,'site' )}} </p>
                  </a>
                  <hr>
                  <a href="{{ route('end-user.contact.index') }}" class="d-block">
                      <p class="mb-2"> <span class="me-3"><i class="fas fa-phone-alt icon-sidebar"></i></span> {{TranslationHelper::translate('contact_us' ,'site' )}} </p>
                  </a>
                  <a href="{{ route('end-user.page.show' , 'slug=about-us') }}" class="d-block">
                      <p class="mb-2"> <span class="me-3"><i class="fas fa-building icon-sidebar"></i></span> {{TranslationHelper::translate('about_us' ,'site' )}} </p>
                  </a>
                  <a href="{{ route('end-user.page.show' , 'slug=terms-and-conditions') }}" class="d-block">
                      <p class="mb-2"> <span class="me-3"><i class="fas fa-head-side-cough icon-sidebar"></i></span> {{TranslationHelper::translate('terms_and_conditions' ,'site' )}} </p>
                  </a>
                  <a href="{{ route('end-user.page.show' , 'slug=privacy-policy') }}" class="d-block">
                      <p class="mb-2"> <span class="me-3"><i class="fas fa-blinds-raised icon-sidebar"></i></span> {{TranslationHelper::translate('privacy_policy' ,'site' )}} </p>
                  </a>
              </div>

              {{-- <div class="sidebar-social">
                  <h4>Follow Us</h4>
                  <a href="#"><i class="fab fa-facebook"></i></a>
                  <a href="#"><i class="fab fa-twitter"></i></a>
                  <a href="#"><i class="fab fa-instagram"></i></a>
                  <a href="#"><i class="fab fa-linkedin"></i></a>
              </div> --}}
              
          </div>
      </div>
  </div>
  <!-- sidebar-popup end -->
