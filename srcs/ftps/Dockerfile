FROM alpine:latest

RUN apk update

RUN apk add vsftpd openssl openrc

RUN echo 'root:root' | chpasswd

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/ftps-selfsigned.key \
    -out /etc/ssl/certs/ftps-selfsigned.crt \
    -subj "/C=RU/ST=Kazan/L=Kazan/O=21/OU=School/CN=localhost"

COPY srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN mkdir -p /var/log/ftp && touch /var/log/ftp/xferlog

EXPOSE 20 21

ENTRYPOINT vsftpd /etc/vsftpd/vsftpd.conf