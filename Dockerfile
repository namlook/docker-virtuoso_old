# Pull base image.
FROM ubuntu:12.04
MAINTAINER Namlook <n.namlook@gmail.com>

# Update ubuntu
RUN export DEBIAN_FRONTEND=noninteractive && \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y build-essential && \
    apt-get install -y software-properties-common && \
    apt-get install -y byobu curl git htop man vim wget iputils-arping iputils-clockdiff iputils-ping iputils-tracepath traceroute && \
    apt-get -y install unzip autoconf automake libtool flex bison gperf gawk m4 make openssl libssl-dev net-tools

RUN adduser --disabled-password --home=/home/virtuoso --gecos "" virtuoso

ADD ./virtuoso-opensource-7.1.0.zip /home/virtuoso/
ADD ./install-virtuoso.sh /home/virtuoso/

RUN chmod +x /home/virtuoso/install-virtuoso.sh
RUN chown -R virtuoso:virtuoso /home/virtuoso

WORKDIR /home/virtuoso
RUN su - virtuoso -c "/home/virtuoso/install-virtuoso.sh"


EXPOSE 8890 1111
# RUN mkdir /home/virtuoso/virtuoso/share/data
# VOLUME ['/home/virtuoso/virtuoso/var/lib/virtuoso/db', '/home/virtuoso/virtuoso/share/data']
USER virtuoso
CMD  /home/virtuoso/virtuoso/bin/virtuoso-t -f -c /home/virtuoso/virtuoso/var/lib/virtuoso/db/virtuoso.ini

