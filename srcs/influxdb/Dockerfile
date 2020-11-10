FROM alpine:latest

RUN apk update 

RUN apk add supervisor influxdb

COPY srcs/supervisor.conf /etc/supervisord.conf

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN apk add glibc-2.32-r0.apk
RUN rm -f glibc-2.32-r0.apk

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.3_linux_amd64.tar.gz
RUN tar xvfz telegraf-1.15.3_linux_amd64.tar.gz
RUN rm -f telegraf-1.15.3_linux_amd64.tar.gz
RUN cp -r /telegraf-1.15.3/* /
RUN ./usr/bin/telegraf -sample-config --input-filter docker --output-filter influxdb > /etc/telegraf/telegraf.conf

VOLUME ["/var/lib"]

EXPOSE 8086

ENTRYPOINT /usr/bin/supervisord