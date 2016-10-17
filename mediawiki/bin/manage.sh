#!/bin/bash

start() {
    echo "Setting up crond, starting php-fpm..."
    crond -d 3 && php-fpm -F
}

preStart() {
    while [ ! -d /var/www/mediawiki/images/thumb ]; do
        echo "Waiting for images to copy..."
        sleep 1
    done && start
}

until
    cmd=$1
    if [ -z "$cmd" ]; then
        echo "please specify a function name"
    fi
    shift 1
    $cmd "$@"
    [ "$?" -ne 127 ]
do
    echo "please specify a function name"
    exit
done
