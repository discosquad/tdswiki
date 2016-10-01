#!/bin/bash

: ${EXT_DIR:-extensions}

extensions=(
	https://extdist.wmflabs.org/dist/extensions/MobileFrontend-REL1_27-717861c.tar.gz
	https://extdist.wmflabs.org/dist/extensions/YouTube-REL1_27-555d66a.tar.gz
	https://extdist.wmflabs.org/dist/extensions/MultimediaViewer-REL1_27-15e42f9.tar.gz
	https://extdist.wmflabs.org/dist/extensions/VisualEditor-REL1_27-9da5996.tar.gz
	https://extdist.wmflabs.org/dist/extensions/RandomImage-REL1_27-9f11fbd.tar.gz
	https://extdist.wmflabs.org/dist/extensions/ImageTagging-REL1_27-c0a7dce.tar.gz
)

echo
for ext_url in ${extensions[@]}; do
	echo "Downloading ${ext_url}"
	wget -qO - $ext_url|tar -C ${EXT_DIR} -xz
	echo "Done downloading ${ext_url}"
	echo
done
