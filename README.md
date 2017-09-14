# How to use

## Add keys to etcd 
etcdctl mkdir /nginx-config/proxy00/owncloud-proxy/
etcdctl set /nginx-config/proxy00/owncloud-proxy/port 80
etcdctl set /nginx-config/proxy00/owncloud-proxy/server_name pan.trans-cosmos.com.cn
etcdctl set /nginx-config/proxy00/owncloud-proxy/client_max_body_size 500m
etcdctl set /nginx-config/proxy00/owncloud-proxy/proxy_pass owncloud-proxy

## Create docker container
#Add environment variable

- ETCD_CLIENT_IP  (ETCD node IP}

# docker-nginx-etcd
- docker run --name=some-name -p 80:80 -e ETCD-CLIENT-IP=192.168.0.1 -d xingjiudong/nginx-etcd
