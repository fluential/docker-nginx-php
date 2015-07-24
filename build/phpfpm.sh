#!/usr/bin/env bash
set -e
/usr/lib/php5/php5-fpm-checkconf || exit -1
exec /usr/sbin/php5-fpm --nodaemonize --fpm-config /etc/php5/fpm/php-fpm.conf 2>&1
