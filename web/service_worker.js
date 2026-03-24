const CACHE_NAME = 'flutter-app-cache-v1.1';
const urlsToCache = [
  '/index.html',
  '/main.dart.js',
  '/styles.css',
  '/assets/images'
];

// Install event - do not cache assets, just skip waiting
self.addEventListener('install', (event) => {
  event.waitUntil(self.skipWaiting());
});

// Fetch event - always fetch from the network, no caching
self.addEventListener('fetch', (event) => {
  event.respondWith(
    fetch(event.request)
      .catch(() => {
        // Optionally, you can return a fallback page if the network fails
        return caches.match('/offline.html');
      })
  );
});

// Activate event - remove all caches immediately
self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys().then((cacheNames) => {
      return Promise.all(
        cacheNames.map((cacheName) => {
          // Delete all caches
          return caches.delete(cacheName);
        })
      );
    })
  );
});
