# How to use

## Add keys to etcd 
- etcdctl mkdir /nginx-config/project00/jenkins.example.com:80
- etcdctl set /nginx-config/project00/jenkins.example.com:80/client_mas_body_size 500m
- etcdctl set /nginx-config/project00/jenkins.example.com:80/proxy_read_timeout 300
-
- etcdctl mkdir /nginx-config/project00/jenkins.example.com:80/1
- etcdctl set /nginx-config/project00/jenkins.example.com:80/1/location /jenkins
-
- etcdctl mkdir /nginx-config/project00/jenkins.example.com:80/1/properties
- etcdctl set /nginx-config/project00/jenkins.example.com:80/1/properties/proxy_pass http://jenkins:8080
- etcdctl set /nginx-config/project00/jenkins.example.com:80/1/properties/proxy_redirect off
- etcdctl set /nginx-config/project00/jenkins.example.com:80/1/properties/proxy_send_timeout 300
-
- etcdctl mkdir /nginx-config/project00/jenkins.example.com:80/1/proxy_set_header
- etcdctl set /nginx-config/project00/jenkins.example.com:80/1/proxy_set_header/X-Forwarded-For $proxy_add_x_forwarded_for
- etcdctl set /nginx-config/project00/jenkins.example.com:80/1/proxy_set_header/X-Real-IP $remote_add
- etcdctl set /nginx-config/project00/jenkins.example.com:80/1/proxy_set_header/Host $host
-
- etcdctl mkdir /nginx-config/project00/jenkins.example.com:80/2
- etcdctl set /nginx-config/project00/jenkins.example.com:80/2/location /
-
- etcdctl mkdir /nginx-config/project00/jenkins.example.com:80/2/properties
- etcdctl set /nginx-config/project00/jenkins.example.com:80/2/properties/root /usr/share/nginx/html
- etcdctl set /nginx-config/project00/jenkins.example.com:80/2/properties/index index.html
## Create docker container
#Add environment variable

- ETCD_CLIENT_IP  (ETCD node IP}
- PROJECT_NAME 

# docker-nginx-etcd
- docker run --name=some-name -p 80:80 -e ETCD_CLIENT_IP=192.168.0.1 -e PROJECT_NAME=project00 -d openfrontier/nginx-etcd:latest
