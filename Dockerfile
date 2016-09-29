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
	&& rm -rf /tmp/install_extensions.sh \
	&& apk del \
		bash
