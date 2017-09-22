#!/bin/bash
set -e

confd -onetime -backend etcd -node http://${ETCD_CLIENT_IP}:2379 --prefix="/nginx-config/${PROJECT_NAME}"
cat /etc/nginx/conf.d/default.conf

exec nginx -g 'daemon off;'
