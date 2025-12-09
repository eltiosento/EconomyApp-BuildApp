'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "f58d6cce54fd0367d9c158626308a8f1",
"assets/AssetManifest.bin.json": "1680101b634acea4dc7a444ba3df0ba3",
"assets/AssetManifest.json": "49f2e4d7823c5ec6388055996e9267e0",
"assets/assets/fonts/Montserrat-Bold.otf": "9c71d42b6a840ecfda8fc555040a1c76",
"assets/assets/fonts/Montserrat-Medium.otf": "d815b0a29adf3450c55f56e2fb813be4",
"assets/assets/icons/agua.png": "c1b4553aeecd66cd5a6ce0a108cf6b72",
"assets/assets/icons/ahorros.png": "d0064bf7517a53fc2ea9dc333f280f55",
"assets/assets/icons/ahorros2.png": "a36cfabc86fda4c4ab28a3e4d876a00c",
"assets/assets/icons/aliexpress.png": "3b3ca3ae052de0d14c5e4939b932170f",
"assets/assets/icons/alquiler.png": "716438c6183417795e110a1edd02db7e",
"assets/assets/icons/Amazon_icon.png": "ae3721893114f03851acd77b3bdd8768",
"assets/assets/icons/baby.png": "69cf133080cc457075e0723804d7c849",
"assets/assets/icons/boy.png": "74f5f785b4dbcc2e14e114911e7308e3",
"assets/assets/icons/cafe.png": "5759286a9838fe46dcc237a75f2e093f",
"assets/assets/icons/car-insurance.png": "454779c902013a8694d94d02434fcbdb",
"assets/assets/icons/car.png": "dec6b5cf531d5bcf1d5c1308e816bd91",
"assets/assets/icons/carrefour.png": "3b5d2317a20eba75c87ae1de8882041a",
"assets/assets/icons/celbraiones.png": "52e1fa2d38f332394ae3593ea741df23",
"assets/assets/icons/comida_para_llevar.png": "5d469d895194393d0e4f9ebf5bebf48d",
"assets/assets/icons/consum.png": "0ce952859e3b7589afadf115492c569a",
"assets/assets/icons/corte_ingles.png": "df41fdbe7752178d2331c47aa2943cc6",
"assets/assets/icons/default.png": "dc809183f54f8588a2b705230902982f",
"assets/assets/icons/family-cash.png": "58a1c8b42bb3f8f202b1a1c7873891f9",
"assets/assets/icons/family.png": "da32b37c8beb1ec7bf0bfb35d0b0ae2d",
"assets/assets/icons/farmacia.png": "381a0aeedce25aa00cf4ee2453111435",
"assets/assets/icons/fixed_expenses.png": "c5c7b717cf0722ddf7d2e51335bf8c34",
"assets/assets/icons/fuel.png": "fdf1b92733bc9ea613017cbf7f57312a",
"assets/assets/icons/gato.png": "ad63023e1672be3fa58dfb72f76be588",
"assets/assets/icons/home_expenses.png": "396e777a1469b1658b665f20e6b746cf",
"assets/assets/icons/horno.png": "fdafb9972fa30118116d6128044762ad",
"assets/assets/icons/ikea.png": "dc2f0b609f2dfde7ee1bdacee7e0d145",
"assets/assets/icons/info.png": "9ade13d34227e88daf66cf817dec34a2",
"assets/assets/icons/jysk.png": "f8eef84db60be989f9418b3d50c4da60",
"assets/assets/icons/leisure.png": "753ee6e988d08e6acb9d3ed42498a0d3",
"assets/assets/icons/leroy.png": "0bb472ff702966e69f8a71ceabb16e9a",
"assets/assets/icons/lowi.png": "ca31fd82714b914666b48bc4a0ecf8ec",
"assets/assets/icons/luz.png": "67fa44bffd28865f8dfe746b060ba45e",
"assets/assets/icons/man.png": "4a3330fe6ea7c81faccf73d03120ece8",
"assets/assets/icons/mas_y_mas.png": "681070234a4b8203fbdcbd4fbcd6169c",
"assets/assets/icons/mechanic.png": "88f7eee20711af6473abfa57c789f2c3",
"assets/assets/icons/mercadona.png": "15525aa3c7c3f4e23dac521c8af8ae70",
"assets/assets/icons/other_expenses.png": "9bddfedc405e7d7443cbd044eac6675c",
"assets/assets/icons/payroll.png": "d3c8fc2919165cdc2d0ea60976d4ad46",
"assets/assets/icons/peluqueria.png": "4eda79424ac1cc1134190d5815936331",
"assets/assets/icons/prestamo.png": "9fc4c5ba830f5cee02f8c8bef41bd369",
"assets/assets/icons/restaurante.png": "61b832dc1443b3135684fcf4890e61bc",
"assets/assets/icons/savings.png": "5cf73d8f4c788c9d5bd1b907740262d9",
"assets/assets/icons/savings_car.png": "c0c20341dbb3893e6b9778757ebb0321",
"assets/assets/icons/savings_family.png": "bf832033f042e94da527309da9710c6c",
"assets/assets/icons/saving_baby.png": "974167fb87e86d88abf70c5489428c6c",
"assets/assets/icons/sense_us.png": "385a9c5e592544b329c1546e2293cd0b",
"assets/assets/icons/shopping-mall.png": "d3f9bd6642227f0a45871f2df7fe7b47",
"assets/assets/icons/spar.png": "9cfd313527fd71a8ab11cee5c7dd10f9",
"assets/assets/icons/streaming.png": "7e1deee4f10a77b12a1d9e4d33940b8d",
"assets/assets/icons/supermarkets.png": "70f82819645c160fde6569b6cbcc6c4f",
"assets/assets/icons/tips.png": "4505cb0c023f1f8fafa2c3bce4825d7e",
"assets/assets/icons/total_incomes.png": "24946fc16ae0df88e84709d92e5c31fe",
"assets/assets/icons/viajes.png": "a15cba6105984f3f3aea8601f7c63fb0",
"assets/assets/icons/woman.png": "2db113dd0f1492d7f98521db924f9479",
"assets/assets/images/img_login.png": "326793bb7bbb9723f3836c92177599ba",
"assets/assets/images/img_register.png": "06bc73fb9bb6cc8a1e6458905b45bd73",
"assets/assets/images/logo.png": "edd18d5f45b927aecd520c3f95074fcd",
"assets/FontManifest.json": "37d9f065b35649f084f603ca1282e64a",
"assets/fonts/MaterialIcons-Regular.otf": "7598e806dcb744ddd118677d5c470d2e",
"assets/NOTICES": "7c77ff06af35eeca2b82bbefe4fc016f",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "e218060f243b84c62029ed574fe50157",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "deaeeb2428a9fcc09530a769330a6b4d",
"/": "deaeeb2428a9fcc09530a769330a6b4d",
"main.dart.js": "92e7a2fdaf641e80855c324166fe6220",
"manifest.json": "60bd2ba7f061524e100a3d90f67101ae",
"version.json": "bdd4240bef99abd74e167af4ba1026ad"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
