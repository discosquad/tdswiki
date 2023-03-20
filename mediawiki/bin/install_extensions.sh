#!/bin/bash

set -e

: ${EXT_DIR:-extensions}

extensions=(
  https://extdist.wmflabs.org/dist/extensions/MobileFrontend-REL1_39-12efce7.tar.gz
  https://extdist.wmflabs.org/dist/extensions/YouTube-REL1_39-f272bb3.tar.gz
  https://extdist.wmflabs.org/dist/extensions/MultimediaViewer-REL1_39-c311f4e.tar.gz
  https://extdist.wmflabs.org/dist/extensions/RandomImage-REL1_39-a3cccf7.tar.gz
  https://extdist.wmflabs.org/dist/extensions/CategoryTree-REL1_39-9e6b7c8.tar.gz
  https://extdist.wmflabs.org/dist/extensions/ParserFunctions-REL1_39-5cdead8.tar.gz
  https://extdist.wmflabs.org/dist/extensions/MsUpload-REL1_39-f4941a8.tar.gz
)

for ext_url in ${extensions[@]}; do
  echo "Downloading ${ext_url}"
  wget -qO - $ext_url | tar -C ${EXT_DIR} -xz
  echo "Done downloading ${ext_url}"
done
