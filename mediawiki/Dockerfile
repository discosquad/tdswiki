FROM ghcr.io/chiefy/alpine-mediawiki:latest

ENV \
    EXT_DIR=/var/www/mediawiki/extensions\
    SKIN_DIR=/var/www/mediawiki/skins\
    PHP_FPM_PORT=9000

USER root

COPY etc/crontab /etc/crontabs/root

RUN \
    apk update \
    && apk add \
    bash \
    curl \
    git \
    openssl \
    php84-tokenizer \
    php84-simplexml \
    php84-calendar \
    php84-xmlwriter \
    && touch /var/log/mediawiki.log \
    && chown www /var/log/mediawiki.log \
    && chown -R www:nogroup ${EXT_DIR}

USER www

COPY bin/install_extensions.sh /var/www/mediawiki
COPY etc/LocalSettings.php /var/www/mediawiki
COPY bin/manage.sh /usr/local/bin/manage.sh

RUN /var/www/mediawiki/install_extensions.sh \
    && rm -rf /var/www/mediawiki/install_extensions.sh \
    && rm -rf /var/www/mediawiki/images/*

ENTRYPOINT [ "/usr/local/bin/manage.sh" ]

CMD [ "preStart" ]
