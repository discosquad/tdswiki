#!/bin/bash

set -e 

: ${EXT_DIR:-extensions}

extensions=(
	https://extdist.wmflabs.org/dist/extensions/MobileFrontend-REL1_31-7f66849.tar.gz 
	https://extdist.wmflabs.org/dist/extensions/YouTube-REL1_31-f6252db.tar.gz  
	https://extdist.wmflabs.org/dist/extensions/MultimediaViewer-REL1_31-1273d3e.tar.gz
	https://extdist.wmflabs.org/dist/extensions/RandomImage-REL1_31-a1b5400.tar.gz 
	https://extdist.wmflabs.org/dist/extensions/CategoryTree-REL1_31-c24e5ed.tar.gz
	https://extdist.wmflabs.org/dist/extensions/ParserFunctions-REL1_31-7ec426b.tar.gz
	https://extdist.wmflabs.org/dist/extensions/MsUpload-REL1_31-2e2efd5.tar.gz
	https://github.com/discosquad/slack_mediawiki/archive/1.0.5.tar.gz
)

for ext_url in ${extensions[@]}; do
	echo "Downloading ${ext_url}"
	wget -qO - $ext_url|tar -C ${EXT_DIR} -xz
	echo "Done downloading ${ext_url}"
done

# Fix SlackNotifications path
mv ${EXT_DIR}/slack_mediawiki-1.0.5/SlackNotifications ${EXT_DIR}
rm -rf ${EXT_DIR}/slack_mediawiki-1.0.5
