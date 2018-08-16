FROM nginx:1.15.2-alpine

RUN \
	apk update \
	&& apk add apache2-utils

COPY etc/nginx.conf /etc/nginx/nginx.conf
COPY etc/htpasswd /etc/nginx/.htpasswd
