#!/bin/bash

set -e

: ${EXT_DIR:-extensions}

extensions=(
  https://extdist.wmflabs.org/dist/extensions/MobileFrontend-REL1_31-7f66849.tar.gz
  https://extdist.wmflabs.org/dist/extensions/YouTube-REL1_31-f6252db.tar.gz
  https://extdist.wmflabs.org/dist/extensions/MultimediaViewer-REL1_31-1273d3e.tar.gz
  https://extdist.wmflabs.org/dist/extensions/RandomImage-REL1_31-a1b5400.tar.gz
  https://extdist.wmflabs.org/dist/extensions/CategoryTree-master-ece3dc2.tar.gz
  https://extdist.wmflabs.org/dist/extensions/ParserFunctions-master-4395442.tar.gz
  https://extdist.wmflabs.org/dist/extensions/MsUpload-master-899c6ad.tar.gz
)

for ext_url in ${extensions[@]}; do
  echo "Downloading ${ext_url}"
  wget -qO - $ext_url | tar -C ${EXT_DIR} -xz
  echo "Done downloading ${ext_url}"
done
