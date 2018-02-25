FROM chiefy/alpine-nginx:1.12.2

MAINTAINER Christopher 'Chief' Najewicz <chief@beefdisciple.com>

RUN \
	apk update \
	&& apk add apache2-utils

COPY etc/nginx.conf /etc/nginx/conf/nginx.conf
COPY etc/htpasswd /etc/nginx/.htpasswd
