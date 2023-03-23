#!/bin/bash

set -e

: ${EXT_DIR:-extensions}

extensions=(
  https://extdist.wmflabs.org/dist/extensions/MobileFrontend-REL1_31-7f66849.tar.gz
  https://extdist.wmflabs.org/dist/extensions/YouTube-REL1_31-f6252db.tar.gz
  https://extdist.wmflabs.org/dist/extensions/MultimediaViewer-REL1_31-1273d3e.tar.gz
  https://extdist.wmflabs.org/dist/extensions/RandomImage-REL1_31-a1b5400.tar.gz
  https://extdist.wmflabs.org/dist/extensions/CategoryTree-REL1_32-5866bb9.tar.gz
  https://extdist.wmflabs.org/dist/extensions/ParserFunctions-REL1_32-15fe1aa.tar.gz
  https://extdist.wmflabs.org/dist/extensions/MsUpload-REL1_32-0779791.tar.gz
)

for ext_url in ${extensions[@]}; do
  echo "Downloading ${ext_url}"
  wget -qO - $ext_url | tar -C ${EXT_DIR} -xz
  echo "Done downloading ${ext_url}"
done
