FROM quay.io/chiefy/alpine-php-mediawiki:1.27.1

MAINTAINER Christopher 'Chief' Najewicz <chief@beefdisciple.com>

ENV EXT_DIR=/var/www/mediawiki/extensions

COPY install_extensions.sh /tmp

USER root

RUN \
	apk update \
	&& apk add \
		bash \
		openssl \
		ca-certificates \
	&& su -s /bin/ash -c "/tmp/install_extensions.sh" www \
	rm -rf /tmp/install_extensions.sh \

USER www

COPY LocalSettings.php /var/www/mediawiki

VOLUME /var/www/mediawiki

ENTRYPOINT /bin/ash

CMD -c "while [ ! -d /var/import/images ]; do echo 'Waiting for images to copy...'; sleep 1; done && cp -R /var/import/images /var/www/mediawiki/images && php-fpm -F"
