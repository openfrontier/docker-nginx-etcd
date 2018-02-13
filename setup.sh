#!/bin/bash
set -e

# Get certificate
etcdctl --endpoints http://${ETCD_CLIENT_IP}:2379 get /nginx-config/ssl/${PROXY_SITE_URL}/chain.pem > /etc/nginx/conf.d/chain.crt
etcdctl --endpoints http://${ETCD_CLIENT_IP}:2379 get /nginx-config/ssl/${PROXY_SITE_URL}/private.key > /etc/nginx/conf.d/private.key

confd -onetime -backend etcd -node http://${ETCD_CLIENT_IP}:2379 --prefix="/nginx-config/${PROJECT_NAME}"
cat /etc/nginx/conf.d/default.conf

exec nginx -g 'daemon off;'
