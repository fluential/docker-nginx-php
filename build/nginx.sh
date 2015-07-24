#!/usr/bin/env bash
set -e
/usr/sbin/nginx -t || exit -1
exec /usr/sbin/nginx 2>&1
