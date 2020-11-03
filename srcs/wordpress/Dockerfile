FROM alpine:latest

RUN apk update
RUN apk add --no-cache  openrc nginx supervisor mysql mysql-client php7 php7-fpm php7-json php7-mysqli
RUN rc-update add php-fpm7 default

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xf latest.tar.gz
RUN mv wordpress /var/www/wordpress
RUN rm -rf latest.tar.gz

COPY srcs/nginx.conf /etc/nginx/conf.d/nginx.conf
COPY srcs/supervisor.conf /etc/supervisord.conf

RUN mkdir -p /run/nginx
RUN mkdir -p /var/run/php

COPY ./srcs/wp.sh /
RUN chmod +x wp.sh

EXPOSE 5050
CMD ["/wp.sh"]