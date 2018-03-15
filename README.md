# How to use

## Add keys to etcd 
### https://web01.example.com

- etcdctl set /nginx-config/${PROJECT_NAME}/web01.example.com:80/1/location /
- etcdctl set /nginx-config/${PROJECT_NAME}/web01.example.com:80/1/properties/proxy_pass http://web01
- etcdctl set /nginx-config/${PROJECT_NAME}/web01.example.com:80/1/properties/proxy_redirect off
- etcdctl set /nginx-config/${PROJECT_NAME}/web01.example.com:80/1/properties/proxy_request_buffering off
- etcdctl set /nginx-config/${PROJECT_NAME}/web01.example.com:80/1/properties/proxy_send_timeout 300
- etcdctl set /nginx-config/${PROJECT_NAME}/web01.example.com:80/1/properties/proxy_read_timeout 300
- etcdctl set /nginx-config/${PROJECT_NAME}/web01.example.com:80/1/properties/keepalive_timeout 300
- etcdctl set /nginx-config/${PROJECT_NAME}/web01.example.com:80/1/properties/send_timeout 300
- etcdctl set /nginx-config/${PROJECT_NAME}/web01.example.com:80/1/proxy_set_header/Host '$host'
- etcdctl set /nginx-config/${PROJECT_NAME}/web01.example.com:80/1/proxy_set_header/X-Real-IP '$remote_addr'
- etcdctl set /nginx-config/${PROJECT_NAME}/web01.example.com:80/1/proxy_set_header/X-Forwarded-For '$proxy_add_x_forwarded_for'
- etcdctl set /nginx-config/${PROJECT_NAME}/web01.example.com:80/1/proxy_set_header/X-Forwarded-Proto '$scheme'
- etcdctl set /nginx-config/${PROJECT_NAME}/web01.example.com:80/1/proxy_set_header/X-Forwarded-Host '$http_host'

### https://web02.example.com with certificate

- etcdctl set /nginx-config/${PROJECT_NAME}-certificate/url/1 web02.example.com
- etcdctl set /nginx-config/${PROJECT_NAME}-certificate/web02.example.com.pem < /home/web02.example.com/full_chain.pem
- etcdctl set /nginx-config/${PROJECT_NAME}-certificate/web02.example.com.key < /home/web02.example.com/private.key

- etcdctl set /nginx-config/${PROJECT_NAME}/web02.example.com:443/client_max_body_size 500m
- etcdctl set /nginx-config/${PROJECT_NAME}/web02.example.com:443/root/location /
- etcdctl set /nginx-config/${PROJECT_NAME}/web02.example.com:443/root/properties/deny all
- etcdctl set /nginx-config/${PROJECT_NAME}/web02.example.com:443/root/properties/root /usr/share/nginx/html
- etcdctl set /nginx-config/${PROJECT_NAME}/web02.example.com:443/root/properties/index index.html
- 
- etcdctl set /nginx-config/${PROJECT_NAME}/web02.example.com:443/ssl on
- etcdctl set /nginx-config/${PROJECT_NAME}/web02.example.com:443/ssl_certificate /web02.example.com.pem
- etcdctl set /nginx-config/${PROJECT_NAME}/web02.example.com:443/ssl_certificate_key /web02.example.com.key

- etcdctl set /nginx-config/${PROJECT_NAME}/web02.example.com:443/1/location /share
- etcdctl set /nginx-config/${PROJECT_NAME}/web02.example.com:443/1/properties/proxy_pass http://web02
- etcdctl set /nginx-config/${PROJECT_NAME}/web02.example.com:443/1/properties/proxy_redirect off
- etcdctl set /nginx-config/${PROJECT_NAME}/web02.example.com:443/1/properties/proxy_request_buffering off
- etcdctl set /nginx-config/${PROJECT_NAME}/web02.example.com:443/1/properties/proxy_send_timeout 300
- etcdctl set /nginx-config/${PROJECT_NAME}/web02.example.com:443/1/properties/proxy_read_timeout 300
- etcdctl set /nginx-config/${PROJECT_NAME}/web02.example.com:443/1/properties/keepalive_timeout 300
- etcdctl set /nginx-config/${PROJECT_NAME}/web02.example.com:443/1/properties/send_timeout 300
- etcdctl set /nginx-config/${PROJECT_NAME}/web02.example.com:443/1/proxy_set_header/Host '$host'
- etcdctl set /nginx-config/${PROJECT_NAME}/web02.example.com:443/1/proxy_set_header/X-Real-IP '$remote_addr'
- etcdctl set /nginx-config/${PROJECT_NAME}/web02.example.com:443/1/proxy_set_header/X-Forwarded-For '$proxy_add_x_forwarded_for'
- etcdctl set /nginx-config/${PROJECT_NAME}/web02.example.com:443/1/proxy_set_header/X-Forwarded-Proto '$scheme'
- etcdctl set /nginx-config/${PROJECT_NAME}/web02.example.com:443/1/proxy_set_header/X-Forwarded-Host '$http_host'
#Add environment variable

- ETCD_CLIENT_IP  (ETCD node IP}
- PROJECT_NAME 

# docker-nginx-etcd
- docker run --name=some-name -p 80:80 -p 443:433-e ETCD_CLIENT_IP=192.168.0.1 -e PROJECT_NAME=${PROJECT_NAME} -d openfrontier/nginx-etcd:1.13
