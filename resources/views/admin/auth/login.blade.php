<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Dalala</title>
    <link href="{{ asset('dashboard/assets/css/login.css') }}" rel="stylesheet" type="text/css" />

</head>
<body>

    <div class="background-wrap">
        <div class="background"></div>
    </div>

    <form id="accesspanel" method="POST" action="{{ route('login') }}">
        @csrf
        <h1 id="litheader">Dalala</h1>
        <div class="inset">
            <p style="margin-bottom: 20px">
                <input type="text" id="email" class="@error('email') is-invalid @enderror" placeholder="Email address" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>
                @error('email')
                <span class="invalid-feedback" role="alert">
                    <strong style="color:red">{{ $message }}</strong>
                </span>
                @enderror
            </p>
            <p style="margin-bottom: 10px">
                <input type="password" id="password"  placeholder="password" class="@error('password') is-invalid @enderror" name="password" required autocomplete="current-password">
                @error('password')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                </span>
                @enderror
            </p>
            <div style="text-align: center;">
                <div class="checkboxouter">
                    <input type="checkbox" name="remember" id="remember"  {{ old('remember') ? 'checked' : '' }}>
                    <label class="checkbox"></label>
                </div>
                <label for="remember">Remember me</label>
            </div>
            <input class="loginLoginValue" type="hidden" name="service" value="login" />
        </div>
        <p class="p-container">
            <input type="submit" name="Login" id="go" value="login">
        </p>
    </form>

</body>
</html>
