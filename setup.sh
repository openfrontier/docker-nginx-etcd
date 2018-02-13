#!/bin/bash
set -e

# Get certificate
count=$(etcdctl --endpoints http://${ETCD_CLIENT_IP}:2379 ls /nginx-config/internet-ssl-certificate/url | wc -l)

for((i=1;i<=${count} ;i++));
do urls=`etcdctl --endpoints http://${ETCD_CLIENT_IP}:2379 get /nginx-config/internet-ssl-certificate/url/$i`;
   etcdctl --endpoints http://${ETCD_CLIENT_IP}:2379 get /nginx-config/internet-ssl-certificate/${urls}.pem > /${urls}.pem;
   etcdctl --endpoints http://${ETCD_CLIENT_IP}:2379 get /nginx-config/internet-ssl-certificate/${urls}.key > /${urls}.key;
   chmod 600 /${urls}.pem;
   chmod 600 /${urls}.key;
done


confd -onetime -backend etcd -node http://${ETCD_CLIENT_IP}:2379 --prefix="/nginx-config/${PROJECT_NAME}"
cat /etc/nginx/conf.d/default.conf

exec nginx -g 'daemon off;'
