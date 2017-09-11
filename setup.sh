#!/bin/bash
set -e

netime -backend etcd -node http://${ETCD_CLIENT_IP}:2379 --prefix="/nginx-config/proxy00"

exec nginx -g 'daemon off;'
