#!/bin/bash
set -o pipefail

# Get certificate
list=$(etcdctl --endpoints http://${ETCD_CLIENT_IP}:2379 ls /nginx-config/${PROJECT_NAME}-certificate)
result=$(echo $?)

if [ ${result} -eq 0 ]
then
    list=$(etcdctl --endpoints http://${ETCD_CLIENT_IP}:2379 ls /nginx-config/${PROJECT_NAME}-certificate | sed "s/\/nginx-config\/${PROJECT_NAME}-certificate\///g")
    for url in ${list}
    do
    etcdctl --endpoints http://${ETCD_CLIENT_IP}:2379 get /nginx-config/${PROJECT_NAME}-certificate/${url}/pem > /${url}.pem;
    etcdctl --endpoints http://${ETCD_CLIENT_IP}:2379 get /nginx-config/${PROJECT_NAME}-certificate/${url}/key > /${url}.key;
    done
    echo "Download complete."
else
    echo "No certificate."
fi

# Generating the nginx configuration file
confd -onetime -backend etcd -node http://${ETCD_CLIENT_IP}:2379 --prefix="/nginx-config/${PROJECT_NAME}"
cat /etc/nginx/conf.d/default.conf

exec nginx -g 'daemon off;'
