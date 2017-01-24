#!/bin/bash
apt-get -y install nova-compute nova-api-metadata nova-network
cp nova.conf /etc/nova/

