<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dalalah</title>

    <!-- Styles -->
    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
        integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
        crossorigin="anonymous"
        referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="mail/style/mail.css" />
</head>
<body>
<main>
    <section class="main_view">
        <div class="splitter">
            <div class="start">
                <div class="data">
                    <div class="logo">
                        <img src="landing-assets/media/Dalalah.png" alt="Dalalah Logo" />
                    </div>
                    <h1>Dear {{$user->name }} </h1>
                    <p>you have register successfully please click <a href="{{ $link }}"> here</a> to register</p>
                </div>
            </div>

        </div>
    </section>

    <footer>
        <p>
            Copyright &copy; 2023 <a href="https://www.dalalah.co/">Dalalah</a> -
            All Rights Reserved
        </p>
    </footer>
</main>
</body>
</html>
