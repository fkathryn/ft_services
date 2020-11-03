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
docker build -t phpmyadmin-image ./srcs/php/
kubectl apply -f srcs/yaml/php.yaml

#build wordpress
docker build -t wordpress-image ./srcs/wordpress/
kubectl apply -f srcs/yaml/wordpress.yaml

kubectl apply -f srcs/yaml/pv_volume.yaml
kubectl apply -f srcs/yaml/pv_claim.yaml

#build wordpress
docker build -t mysql-image ./srcs/mysql/
kubectl apply -f srcs/yaml/mysql.yaml