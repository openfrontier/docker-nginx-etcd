FROM nginx:latest
MAINTAINER XJD 25635680@qq.com

# Env information. 
ENV ETCD_VERSION v2.3.7
ENV CONFD_VERSION 0.11.0 

# Install etcdctl.
RUN apt-get update && \
    apt-get install wget -y && \
    rm -rf /var/lib/apt/lists/*
RUN wget https://github.com/coreos/etcd/releases/download/${ETCD_VERSION}/etcd-${ETCD_VERSION}-linux-amd64.tar.gz --no-check-certificate && \
    tar xvzf etcd-${ETCD_VERSION}-linux-amd64.tar.gz && \
    mv etcd-${ETCD_VERSION}-linux-amd64/etcdctl /usr/local/bin/etcdctl && \
    rm -rf etcd-${ETCD_VERSION}-linux-amd64
RUN wget https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 --no-check-certificate && \
    chmod +x confd-${CONFD_VERSION}-linux-amd64 && \
    mv confd-${CONFD_VERSION}-linux-amd64 /usr/local/bin/confd
 
# Copy configuration file.
COPY ./confd /etc/confd
COPY ./setup.sh /

CMD ["/setup.sh"]
