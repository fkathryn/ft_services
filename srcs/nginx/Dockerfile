FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add nginx openssl openssh supervisor

COPY ./srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/supervisor.conf /etc/supervisord.conf

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=RU/ST=Kazan/L=Kazan/O=21/OU=School/CN=localhost"

RUN echo -e "admin\nadmin" | adduser admin

COPY ./srcs/nginx.sh /
RUN chmod +x nginx.sh
RUN mkdir -p /run/nginx/

EXPOSE 80 443 22

CMD ["/nginx.sh"]