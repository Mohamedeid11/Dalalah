importScripts('https://www.gstatic.com/firebasejs/8.3.2/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.3.2/firebase-messaging.js');

firebase.initializeApp({
    apiKey: "AIzaSyA2hnoSubVjqB4DIUb4VuTxnuKuOKTxSBU",
    authDomain: "dalalah-11acc.firebaseapp.com",
    projectId: "dalalah-11acc",
    storageBucket: "dalalah-11acc.appspot.com",
    messagingSenderId: "250345996124",
    appId: "1:250345996124:web:bd357bd174ae55af348b99",
    measurementId: "G-JHZTGBW2W8"
});
const messaging = firebase.messaging();
messaging.setBackgroundMessageHandler(function({data:{title,body,icon}}) {
    return self.registration.showNotification(title,{body,icon});
});

//old code
// const messaging = firebase.messaging();
