#!/bin/sh

rc default
/etc/init.d/mariadb setup
rc-service mariadb start
echo "create database my_db;" | mysql
echo "grant all on *.* to admin@'%' identified by 'admin' with grant option; flush privileges;" | mysql

mysql my_db < my_db.sql

rc-service mariadb stop
/usr/bin/mysqld_safe