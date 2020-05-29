#!/bin/bash
set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
        set -- apache2-foreground "$@"
fi

if [ ! -f /var/www/html/config.php ]; then
  cd ~
  git clone https://github.com/chuushi/CoreProtect-Lookup-Web-Interface.git
  cp CoreProtect-Lookup-Web-Interface/* /var/www/html -R && chown www-data:www-data /var/www/html/* -R
fi

exec "$@"
