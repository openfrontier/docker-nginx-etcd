#!/bin/bash
set -e

# Get certificate
count=$(etcdctl ls /nginx-config/internet-ssl-certificate/url | wc -l)

for((i=1;i<=${count} ;i++));
do urls=`etcdctl get /nginx-config/internet-ssl-certificate/url/$i`;
   etcdctl get /nginx-config/internet-ssl-certificate/${urls}.pem > /${urls}.pem;
   etcdctl get /nginx-config/internet-ssl-certificate/${urls}.key > /${urls}.key;
   chmod 600 /${urls}.pem;
   chmod 600 /${urls}.key;
done


confd -onetime -backend etcd -node http://${ETCD_CLIENT_IP}:2379 --prefix="/nginx-config/${PROJECT_NAME}"
cat /etc/nginx/conf.d/default.conf

exec nginx -g 'daemon off;'
