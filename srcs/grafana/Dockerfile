FROM alpine:latest

RUN apk update

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN apk add glibc-2.32-r0.apk
RUN rm -f glibc-2.32-r0.apk

RUN wget https://dl.grafana.com/oss/release/grafana-7.1.5.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.1.5.linux-amd64.tar.gz
RUN rm -f grafana-7.1.5.linux-amd64.tar.gz

COPY srcs/grafana.db /grafana-7.1.5/data/grafana.db

EXPOSE 3000

WORKDIR /grafana-7.1.5/bin/

ENTRYPOINT ./grafana-server