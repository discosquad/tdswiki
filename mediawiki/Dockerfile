FROM quay.io/chiefy/alpine-php-mediawiki:1.27.1

MAINTAINER Christopher 'Chief' Najewicz <chief@beefdisciple.com>

ENV EXT_DIR=/var/www/mediawiki/extensions

USER root

RUN \
	apk update \
	&& apk add \
		bash \
		openssl \
		ca-certificates \
	&& mkdir -p /var/import \
	&& chown -R www /var/import

USER www

COPY install_extensions.sh /var/www/mediawiki
COPY LocalSettings.php /var/www/mediawiki

RUN \
	/var/www/mediawiki/install_extensions.sh \
	&& rm -rf /var/www/mediawiki/install_extensions.sh

ENTRYPOINT [ "/bin/bash" ]

CMD [ \
	"-c", \
	"while [ ! -d /var/import/images ]; do echo 'Waiting for images to copy...'; sleep 1; done && cp -R /var/import/images /var/www/mediawiki/ && php-fpm -F" \
]
