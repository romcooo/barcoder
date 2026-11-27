#!/bin/bash
# Builds the installable app into docs/ (GitHub Pages serves that folder).
# src/app.html holds the whole app; this wraps it in a full HTML page and
# copies the barcode-drawing library and the install files next to it.
set -e
cd "$(dirname "$0")"
[ -d node_modules/bwip-js ] || npm install --silent
rm -rf docs; mkdir docs
{ echo '<!doctype html><html lang="en"><head><meta charset="utf-8">'
  echo '<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">'
  echo '<link rel="manifest" href="manifest.webmanifest"><link rel="icon" href="icon-192.png"><link rel="apple-touch-icon" href="icon-192.png">'
  echo '</head><body>'
  cat src/app.html
  echo '</body></html>'; } > docs/index.html
cp src/manifest.webmanifest src/sw.js src/icon-192.png src/icon-512.png docs/
cp node_modules/bwip-js/dist/bwip-js-min.js docs/
touch docs/.nojekyll
