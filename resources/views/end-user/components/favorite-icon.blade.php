@unless(auth('showroom')->check())
    @if(auth('end-user')->check())
        <div class="car-btns">
            <a href="{{ route('end-user.add-remove-favorite',$car->id) }}" @if(in_array($car->id , app('userFavoritesIds') )) 
            style="color: red;" @endif><i class="far fa-heart"></i></a>
        </div>
    @else
        <div class="car-btns">
            <a href="{{ route('end-user.login') }}"><i class="far fa-heart"></i></a>
        </div>
    @endif
@endunless


