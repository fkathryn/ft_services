FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add nginx supervisor openrc php7 php7-fpm php7-iconv php7-json php7-mbstring php7-mysqli php7-phar php7-session
RUN	rc-update add php-fpm7 default

RUN	mkdir /run/nginx /var/run/php
RUN	mkdir -p /var/www/phpmyadmin /var/www/phpmyadmin/tmp
RUN	chmod +x /var/www/phpmyadmin/tmp

RUN	wget -c https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-english.tar.xz
RUN	tar -xvf phpMyAdmin-latest-english.tar.xz --strip-components 1 -C /var/www/phpmyadmin
RUN	rm -f phpMyAdmin-latest-english.tar.xz

COPY srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY srcs/supervisor.conf /etc/supervisord.conf
COPY srcs/config.inc.php /var/www/phpmyadmin/config.inc.php

COPY ./srcs/php.sh /
RUN chmod +x php.sh

EXPOSE	5000
CMD ["/php.sh"]
