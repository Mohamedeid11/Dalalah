<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="{{ asset('firebase/js/firebase-app.js') }}"></script>
<script src="{{ asset('firebase/js/firebase-messaging.js') }}"></script>


<script>
    const firebaseConfig = {
        apiKey: "AIzaSyA2hnoSubVjqB4DIUb4VuTxnuKuOKTxSBU",
        authDomain: "dalalah-11acc.firebaseapp.com",
        projectId: "dalalah-11acc",
        storageBucket: "dalalah-11acc.appspot.com",
        messagingSenderId: "250345996124",
        appId: "1:250345996124:web:bd357bd174ae55af348b99",
        measurementId: "G-JHZTGBW2W8"
    };

    firebase.initializeApp(firebaseConfig);

    const messaging = firebase.messaging();

    function initFirebaseMessagingRegistration() {
        messaging.requestPermission().then(function () {
            return messaging.getToken()
        }).then(function (token) {
            console.log(token);
            storeToken(token)
        });
    }

    initFirebaseMessagingRegistration();

    function storeToken(token) {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.ajax({
            url: '{{route('admin.user.fcmToken')}}',
            type: 'POST',
            data: {
                token: token
            },
            dataType: 'JSON',
            success: function (response) {
                // alert(response);
            }, error: function (error) {
                // alert(error);
            }
        });
    }
    messaging.onMessage(function (payload) {
        // console.log(payload.notification);
        // console.log(payload.data);
        const noteOptions = {
            body: payload.notification.body,
            icon: '{{asset('assets/images/logo.png')}}',
            url: payload.data.url

        };
        console.log(payload.data['url']);
        if (Notification.permission == 'granted') {
            const notification = new Notification(payload.notification.title, noteOptions).onclick = function () {
                window.open(payload.data['url']);
            };
            // notification.onclick = function () {
            //     window.open(noteOptions.url);
            // };
            // Swal.fire();
        }
    });
</script>
