#!/bin/bash

hostnamectl set-hostname compute

apt-get update
apt-get -y install ubuntu-cloud-keyring
echo "deb http://ubuntu-cloud.archive.canonical.com/ubuntu" "xenial-updates/newton main" > /etc/apt/sources.list.d/cloud.list
apt-get update && apt-get -y dist-upgrade


