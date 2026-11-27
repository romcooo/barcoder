# Coupon Wallet

A small installable web app (PWA) for keeping coupons and loyalty cards on an Android phone and showing them at checkout.

- Capture a code by taking a photo, picking a screenshot, or typing the number.
- The barcode is read from the picture by Chrome's built-in `BarcodeDetector`, or, in Firefox and other browsers without it, by a bundled copy of the ZXing reader ([barcode-detector](https://github.com/Sec-ant/barcode-detector) + `zxing_reader.wasm`, about 1 MB, loaded only when needed). The app then draws a clean copy with [bwip-js](https://github.com/metafloor/bwip-js) and keeps the photo as a backup.
- Nested folders, favorites, tags with filtering (a coupon must have **all** selected tags), search, optional expiry date.
- Checkout screen is always black on white and keeps the screen awake.
- Works offline once opened (service worker).

## Where the data lives

Only on the phone, in the browser's IndexedDB. Nothing is sent anywhere. Clearing Chrome's site data or losing the phone deletes it, so use **⋮ → Save backup file** now and then.

## Layout

| Path | What it is |
|---|---|
| `src/app.html` | The whole app: markup, styles and script in one file |
| `src/sw.js` | Offline cache. Bump `VERSION` whenever you publish a change, or phones keep the old copy |
| `src/manifest.webmanifest`, icons | What Chrome needs to offer "Install app" |
| `build.sh` | Builds `docs/` from `src/` |
| `docs/` | The built site that GitHub Pages serves. Don't edit it by hand |

## Changing the app

```sh
./build.sh        # installs bwip-js the first time, then rebuilds docs/
python3 -m http.server -d docs 8000   # try it at http://localhost:8000
```

Commit both `src/` and `docs/`.
