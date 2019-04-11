FROM vladgh/s3sync:latest 
RUN \
    adduser -S -D -H -u 100 www \
    && chown -R www:root /etc/crontabs \
    && chmod 664 /etc/crontabs/*
USER www
