#!/bin/bash

set -e

: ${EXT_DIR:-extensions}
: ${SKIN_DIR:-skins}

skins=(
  https://extdist.wmflabs.org/dist/skins/Vector-REL1_42-9483c04.tar.gz
  https://extdist.wmflabs.org/dist/skins/MinervaNeue-REL1_42-24d5c6b.tar.gz
)

extensions=(
  https://extdist.wmflabs.org/dist/extensions/ArticleRatings-REL1_42-bd2ea7c.tar.gz
  https://extdist.wmflabs.org/dist/extensions/Collection-REL1_42-6e2f870.tar.gz
  https://extdist.wmflabs.org/dist/extensions/DidYouKnow-REL1_42-5a1c034.tar.gz
  https://extdist.wmflabs.org/dist/extensions/MobileFrontend-REL1_42-03fed6b.tar.gz
  https://extdist.wmflabs.org/dist/extensions/MP3MediaHandler-REL1_42-8604199.tar.gz
  https://extdist.wmflabs.org/dist/extensions/ParserFunctions-REL1_42-8b67321.tar.gz
  https://extdist.wmflabs.org/dist/extensions/RandomImage-REL1_42-3424e73.tar.gz
  https://extdist.wmflabs.org/dist/extensions/RandomImageByCategory-REL1_42-f7efd7f.tar.gz
  https://extdist.wmflabs.org/dist/extensions/RelatedArticles-REL1_42-95514d7.tar.gz
  https://extdist.wmflabs.org/dist/extensions/SelectCategory-REL1_42-ff6ee45.tar.gz
  https://extdist.wmflabs.org/dist/extensions/TopTenPages-REL1_42-8fefdcb.tar.gz
  https://extdist.wmflabs.org/dist/extensions/YouTube-REL1_42-91c97ca.tar.gz
  https://extdist.wmflabs.org/dist/extensions/Mailgun-REL1_42-23d7b4a.tar.gz
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
