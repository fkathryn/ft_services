FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add openrc mysql mysql-client

COPY srcs/mysql_config.cnf /etc/mysql/my.cnf
COPY srcs/my_db.sql /

RUN mkdir -p /var/lib/

VOLUME ["/var/lib"]

COPY ./srcs/mysql.sh /
RUN chmod +x mysql.sh

EXPOSE 3306
CMD ["/mysql.sh"]