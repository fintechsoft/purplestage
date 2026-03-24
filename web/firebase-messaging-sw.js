importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");

firebase.initializeApp({
  apiKey: "AIzaSyA2afEckf4VJzPrc_K1mng-2itbqcP6C3E",
   authDomain: "customer-app-47b79.firebaseapp.com",
   projectId: "customer-app-47b79",
   storageBucket: "customer-app-47b79.appspot.com",
  messagingSenderId: "1034084671943",
  appId: "1:1034084671943:web:1fa224dbf0bb7ca62cf9e2",
  measurementId: "G-81RJPV6B3K"
});

const messaging = firebase.messaging();

messaging.setBackgroundMessageHandler(function (payload) {
    const promiseChain = clients
        .matchAll({
            type: "window",
            includeUncontrolled: true
        })
        .then(windowClients => {
            for (let i = 0; i < windowClients.length; i++) {
                const windowClient = windowClients[i];
                windowClient.postMessage(payload);
            }
        })
        .then(() => {
            const title = payload.notification.title;
            const options = {
                body: payload.notification.score
              };
            return registration.showNotification(title, options);
        });
    return promiseChain;
});
self.addEventListener('notificationclick', function (event) {
    console.log('notification received: ', event)
});