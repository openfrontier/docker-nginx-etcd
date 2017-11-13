FROM nginx:1.13
MAINTAINER XJD 25635680@qq.com

# Env information. 
ENV CONFD_VERSION 0.11.0 

# Install etcdctl.
RUN apt-get update && \
    apt-get install wget -y && \
    rm -rf /var/lib/apt/lists/*
RUN wget https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 --no-check-certificate && \
    chmod +x confd-${CONFD_VERSION}-linux-amd64 && \
    mv confd-${CONFD_VERSION}-linux-amd64 /usr/local/bin/confd
 
# Copy configuration file.
COPY ./confd /etc/confd
COPY ./setup.sh /

CMD ["/setup.sh"]
