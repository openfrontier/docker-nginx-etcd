# How to use

## Add keys to etcd 
etcdctl mkdir /nginx-config/${PROJECT_NAME}/www
etcdctl mkdir /nginx-config/${PROJECT_NAME}/www/location
etcdctl set /nginx-config/${PROJECT_NAME}/www/port 443
etcdctl set /nginx-config/${PROJECT_NAME}/www/server_name www.example.com
etcdctl set /nginx-config/${PROJECT_NAME}/www/location/1 '{"LOCATION": "/www","PROXY_PASS": "www"}'
etcdctl set /nginx-config/${PROJECT_NAME}/www/location/2 '{"LOCATION": "/web","PROXY_PASS": "web"}'
etcdctl set /nginx-config/${PROJECT_NAME}/www/location/3 '{"LOCATION": "/","PROXY_PASS": "192.168.0.1"}'
etcdctl set /nginx-config/${PROJECT_NAME}/www/location/4 '{"LOCATION": "~ .*wp-login.*","PROXY_PASS": "192.168.0.2"}'
etcdctl mkdir /nginx-config/${PROJECT_NAME}/weixin
etcdctl mkdir /nginx-config/${PROJECT_NAME}/weixin/location
etcdctl set /nginx-config/${PROJECT_NAME}/weixin/port 80
etcdctl set /nginx-config/${PROJECT_NAME}/weixin/server_name weixin.example.com
etcdctl set /nginx-config/${PROJECT_NAME}/weixin/location/1 '{"LOCATION": "/weixin","PROXY_PASS": "weixin"}'
etcdctl set /nginx-config/${PROJECT_NAME}/weixin/location/2 '{"LOCATION": "/web","PROXY_PASS": "web"}'
etcdctl set /nginx-config/${PROJECT_NAME}/weixin/location/3 '{"LOCATION": "web/a","PROXY_PASS": "192.168.0.1"}'
etcdctl set /nginx-config/${PROJECT_NAME}/weixin/location/4 '{"LOCATION": "a~ .*wp-login.*","PROXY_PASS": "192.168.0.2"}'

## Create docker container
#Add environment variable

- ETCD_CLIENT_IP  (ETCD node IP}
- PROJECT_NAME 

# docker-nginx-etcd
- docker run --name=some-name -p 80:80 -e ETCD-CLIENT-IP=192.168.0.1 -e PROJECT_NAME=project00 -d xingjiudong/nginx-etcd
