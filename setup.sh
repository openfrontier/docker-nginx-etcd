#!/bin/bash
set -e

# Get certificate
list=$(etcdctl --endpoints http://${ETCD_CLIENT_IP}:2379 ls /nginx-config/${PROJECT_NAME}-certificate/url)
result=$(echo $?)

if [ ${result} -eq 0 ]
then
  count=$(etcdctl --endpoints http://${ETCD_CLIENT_IP}:2379 ls /nginx-config/${PROJECT_NAME}-certificate/url | wc -l)
  for((i=1;i<=${count} ;i++));
  do urls=`etcdctl --endpoints http://${ETCD_CLIENT_IP}:2379 get /nginx-config/${PROJECT_NAME}-certificate/url/$i`;
     etcdctl --endpoints http://${ETCD_CLIENT_IP}:2379 get /nginx-config/${PROJECT_NAME}-certificate/${urls}.pem > /${urls}.pem;
     etcdctl --endpoints http://${ETCD_CLIENT_IP}:2379 get /nginx-config/${PROJECT_NAME}-certificate/${urls}.key > /${urls}.key;
     chmod 600 /${urls}.pem;
     chmod 600 /${urls}.key;
  done
  confd -onetime -backend etcd -node http://${ETCD_CLIENT_IP}:2379 --prefix="/nginx-config/${PROJECT_NAME}"
else
  confd -onetime -backend etcd -node http://${ETCD_CLIENT_IP}:2379 --prefix="/nginx-config/${PROJECT_NAME}"
fi

cat /etc/nginx/conf.d/default.conf

exec nginx -g 'daemon off;'
