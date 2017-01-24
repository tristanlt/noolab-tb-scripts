#!/bin/bash

hostnamectl set-hostname controller

apt-get update
apt-get -y install ntp mysql-server python-mysqldb rabbitmq-server memcached

rabbitmqctl list_users
rabbitmqctl add_user openstack openstack
rabbitmqctl set_permissions openstack ".*" ".*" ".*"
rabbitmqctl delete_user guest
rabbitmqctl status

sed -i s_-l\ 127.0.0.1_-l\ 0.0.0.0_g /etc/memcached.conf
systemctl restart memcached.service

sed -i s_127.0.0.1_0.0.0.0_g /etc/mysql/mysql.conf.d/mysqld.cnf
systemctl restart mysql.service

apt-get -y install ubuntu-cloud-keyring
echo "deb http://ubuntu-cloud.archive.canonical.com/ubuntu" "xenial-updates/newton main" > /etc/apt/sources.list.d/cloud.list
apt-get update && apt-get -y dist-upgrade
