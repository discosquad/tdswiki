#!/bin/bash

: ${EXT_DIR:-extensions}

extensions=(
	https://extdist.wmflabs.org/dist/extensions/MobileFrontend-REL1_31-7f66849.tar.gz 
	https://extdist.wmflabs.org/dist/extensions/YouTube-REL1_27-555d66a.tar.gz
	https://extdist.wmflabs.org/dist/extensions/MultimediaViewer-REL1_27-15e42f9.tar.gz
	https://extdist.wmflabs.org/dist/extensions/RandomImage-REL1_27-9f11fbd.tar.gz
	https://extdist.wmflabs.org/dist/extensions/ImageTagging-REL1_27-c0a7dce.tar.gz
	https://extdist.wmflabs.org/dist/extensions/CategoryTree-REL1_27-b454f2c.tar.gz
	https://extdist.wmflabs.org/dist/extensions/ParserFunctions-REL1_27-d0a5d10.tar.gz
	https://extdist.wmflabs.org/dist/extensions/MsUpload-REL1_27-9415674.tar.gz
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

ls -l ${EXT_DIR}
