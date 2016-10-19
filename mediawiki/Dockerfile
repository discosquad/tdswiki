FROM quay.io/chiefy/alpine-php-mediawiki:1.27.1

MAINTAINER Christopher 'Chief' Najewicz <chief@beefdisciple.com>

ENV \
    EXT_DIR=/var/www/mediawiki/extensions\
    PHP_FPM_PORT=9000

USER root

COPY etc/crontab /etc/crontabs/root

RUN \
    apk update \
    && apk add \
        bash \
        curl \
        openssl \
        ca-certificates \
    && touch /var/log/mediawiki.log \
    && chown www /var/log/mediawiki.log \
    # Install Maps extension w/ composer
    && composer require -d /var/www/mediawiki -vvv -n mediawiki/maps "*" \
    && chown -R www:nogroup ${EXT_DIR}

USER www

COPY bin/install_extensions.sh /var/www/mediawiki
COPY etc/LocalSettings.php /var/www/mediawiki
COPY bin/manage.sh /usr/local/bin/manage.sh
COPY skins/components/common.less /var/www/mediawiki/skins/Vector/components/common.less

RUN /var/www/mediawiki/install_extensions.sh \
    && rm -rf /var/www/mediawiki/install_extensions.sh

USER root

ENTRYPOINT [ "/usr/local/bin/manage.sh" ]

CMD [ "preStart" ]
