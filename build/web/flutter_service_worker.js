'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "android-icon-144x144.png": "cd64b58dad4f7daaaf334c6303305361",
"android-icon-192x192.png": "549caf13976c9dc541338a3169cf87ba",
"android-icon-36x36.png": "8c46427305663fc1c24f513298a7188f",
"android-icon-48x48.png": "d1a8219d64b7d8a018ffacf136c596f9",
"android-icon-72x72.png": "6725704238bb1a0735b5c791498e4af7",
"android-icon-96x96.png": "c26080728040119d4821e44b1a1e833f",
"apple-icon-114x114.png": "0c02117aadfd9e45869d4bfbc92a553a",
"apple-icon-120x120.png": "2aaa50287d13163d70350792f5fd9ec5",
"apple-icon-144x144.png": "cd64b58dad4f7daaaf334c6303305361",
"apple-icon-152x152.png": "755bf027e51027c1462685cb1d85b312",
"apple-icon-180x180.png": "0ba9cdcd54980c400760d6f050d76bc3",
"apple-icon-57x57.png": "a3133a7b5a9e98c3e1b041c7c71503b9",
"apple-icon-60x60.png": "5e357aed43d3d7ad6240697a09a5908e",
"apple-icon-72x72.png": "6725704238bb1a0735b5c791498e4af7",
"apple-icon-76x76.png": "44246c92ad8de00c4b37d3bf211b96c3",
"apple-icon-precomposed.png": "b4fc0e891df224f2e29577639507ecaf",
"apple-icon.png": "b4fc0e891df224f2e29577639507ecaf",
"assets/AssetManifest.json": "9217fc644600b4a85e8c31b1e44079e7",
"assets/assets/images/htp_1.gif": "2c6313f35392ff72cafd0008fc951e75",
"assets/assets/images/htp_2.gif": "49602e05181a30cb4582d6293e356739",
"assets/assets/images/logo_1.png": "307b8e31e99b19f1ac719e12aa9e5919",
"assets/assets/images/LOGO_1024x1024.png": "b96c62bcddc4351f45251bbf8db5a781",
"assets/assets/images/logo_2.png": "6ead4ebce48b90de3bc86473398def80",
"assets/assets/images/LOGO_512x512.png": "55689f875fdcb83a17b4d439ccbe3b9d",
"assets/assets/images/moose.png": "8b60a96c54b42137f3da06a33037efe1",
"assets/assets/images/seager.png": "a5f501c13b5500712180ed95d8c03324",
"assets/FontManifest.json": "18eda8e36dfa64f14878d07846d6e17f",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/lang/en.json": "79ebceaae34cafb7f4c8fa936b1d4c19",
"assets/lang/es.json": "7e56bc1e4c4f310a106510141db9aefd",
"assets/lang/ja.json": "25c49816b8de2c7d7b07e5cd1deb2a5e",
"assets/LICENSE": "6b8b50dd0df4fbef324475fd9f0252a5",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "5a37ae808cf9f652198acde612b5328d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "2bca5ec802e40d3f4b60343e346cedde",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "2aa350bd2aeab88b601a593f793734c0",
"browserconfig.xml": "653d077300a12f09a69caeea7a8947f8",
"favicon-16x16.png": "4563272df7837f45b7cf9e1899c6afce",
"favicon-32x32.png": "deab84ddf38d9f8a43d7e39e9dfc12ab",
"favicon-96x96.png": "c26080728040119d4821e44b1a1e833f",
"favicon.ico": "b83c823b4568a4ea7d233736c26dc639",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"images/icons/icon-128x128.png": "8728a68f9171ca8af1a70bc0eed45b25",
"images/icons/icon-144x144.png": "511b43dcf3573aefa28b8938169c6da8",
"images/icons/icon-152x152.png": "b18edfe8fc739fb0af289bdaac3531cc",
"images/icons/icon-192x192.png": "1404a0505ddcff821f193eac57f5e726",
"images/icons/icon-384x384.png": "fb01a2a3097d1e24f37a60a07a60b56c",
"images/icons/icon-512x512.png": "adc3167a3fbd7ad2c8bd79f3d659eec7",
"images/icons/icon-72x72.png": "ba3d3223ff240d75acc2036dc7327f9f",
"images/icons/icon-96x96.png": "73e45835f718b12e895cc5706656aa54",
"index.html": "7fb046baf3cae568892f036379f6bf98",
"/": "7fb046baf3cae568892f036379f6bf98",
"main.dart.js": "f5f38cf0b1aec620c5df4f99a5828296",
"manifest.json": "0e9f858d17276dcfd61cdb1bd9f5a34d",
"ms-icon-144x144.png": "cd64b58dad4f7daaaf334c6303305361",
"ms-icon-150x150.png": "13715fb39a8100f88a411ca25377095d",
"ms-icon-310x310.png": "6bf131ee76c92ea2a1303149f2b5d220",
"ms-icon-70x70.png": "2d49f126b218571432df6d751f5ef7ff"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
