FROM ghcr.io/chiefy/debian-supercronic:latest

COPY entrypoint.sh /

RUN apt update -y \
    && apt install -y awscli \
    && adduser --system --no-create-home --uid 100 --gid 100 www \
    && echo "@hourly /entrypoint.sh upload" > /etc/crontab \
    && chown www:users /etc/crontab

USER www

ENTRYPOINT [ "/entrypoint.sh" ]