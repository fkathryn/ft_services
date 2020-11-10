#!/bin/sh

minikube start --vm-driver=virtualbox
eval $(minikube docker-env)

#metallb
minikube addons enable metallb
kubectl apply -f srcs/yaml/metallb.yaml

#build nginx
docker build -t nginx-image ./srcs/nginx/
kubectl apply -f srcs/yaml/nginx.yaml

#build phpmyadmin
docker build -t phpmyadmin-image ./srcs/phpmyadmin/
kubectl apply -f srcs/yaml/phpmyadmin.yaml

#build wordpress
docker build -t wordpress-image ./srcs/wordpress/
kubectl apply -f srcs/yaml/wordpress.yaml

#persistent volume
kubectl apply -f srcs/yaml/volume.yaml

#build mysql
docker build -t mysql-image ./srcs/mysql/
kubectl apply -f srcs/yaml/mysql.yaml

#build ftps
docker build -t ftps-image ./srcs/ftps/
kubectl apply -f srcs/yaml/ftps.yaml

# build grafana
docker build -t grafana-image ./srcs/grafana/
kubectl apply -f srcs/yaml/grafana.yaml

# build influxdb
docker build -t influxdb-image ./srcs/influxdb/
kubectl apply -f srcs/yaml/influxdb.yaml