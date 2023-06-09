#!/bin/bash

set -e

: ${EXT_DIR:-extensions}
: ${SKIN_DIR:-skins}

skins=(
#  https://extdist.wmflabs.org/dist/skins/MinervaNeue-REL1_39-7198fd1.tar.gz
  https://extdist.wmflabs.org/dist/skins/Timeless-REL1_39-16f488a.tar.gz
)

extensions=(
  https://extdist.wmflabs.org/dist/extensions/ArticleRatings-REL1_39-b537c5c.tar.gz
  https://extdist.wmflabs.org/dist/extensions/CategoryTree-REL1_39-63ec336.tar.gz
  https://extdist.wmflabs.org/dist/extensions/Collection-REL1_39-ef611cb.tar.gz
  https://extdist.wmflabs.org/dist/extensions/DidYouKnow-REL1_39-3cf57c8.tar.gz
  https://extdist.wmflabs.org/dist/extensions/MobileFrontend-REL1_39-f766e58.tar.gz
  https://extdist.wmflabs.org/dist/extensions/MP3MediaHandler-REL1_39-3066c8e.tar.gz
  https://extdist.wmflabs.org/dist/extensions/ParserFunctions-REL1_39-3eb1eb9.tar.gz
  https://extdist.wmflabs.org/dist/extensions/RandomImage-REL1_39-a3cccf7.tar.gz
  https://extdist.wmflabs.org/dist/extensions/RandomImageByCategory-REL1_39-f731ed8.tar.gz
  https://extdist.wmflabs.org/dist/extensions/RelatedArticles-REL1_39-231da5f.tar.gz
  https://extdist.wmflabs.org/dist/extensions/SelectCategory-REL1_39-855d37f.tar.gz
  https://extdist.wmflabs.org/dist/extensions/TopTenPages-REL1_39-249f352.tar.gz
  https://extdist.wmflabs.org/dist/extensions/YouTube-REL1_39-28a05a9.tar.gz
)

for ext_url in ${extensions[@]}; do
  echo "Downloading ${ext_url}"
  curl -lsS "$ext_url" | tar -C ${EXT_DIR} -xz
  echo "Done downloading ${ext_url}"
done

for skin_url in ${skins[@]}; do
  echo "Downloading ${skin_url}"
  curl -lsS "$skin_url" | tar -C ${SKIN_DIR} -xz
  echo "Done downloading ${skin_url}"
done
