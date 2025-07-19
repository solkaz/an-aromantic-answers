#!/usr/bin/env bash

set -euo pipefail

if ! [ -x "$(command -v cspell)" ]; then
  echo 'Error: cspell is not installed.' >&2
  exit 1
fi

echo "Running spellcheck..."
cspell README.org
echo "Spellcheck complete!"

if ! [ -x "$(command -v pandoc)" ]; then
  echo 'Error: pandoc is not installed.' >&2
  exit 1
fi

echo "Building the webpage..."
pandoc \
  --toc \
  -s README.org \
  -o index.html
echo "Webpage built!"
