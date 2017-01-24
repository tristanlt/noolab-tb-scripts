#!/bin/bash
mysql -u root --password=stack  < glance.sql
apt-get -y install glance python-glanceclient python-mysqldb
cp glance-api.conf /etc/glance/
cp glance-registry.conf /etc/glance/

sudo -u glance glance-manage db_sync

openstack project create --description "Project Services" service
openstack user create --password="glance" glance
openstack role add --project service --user glance admin
openstack service create --name glance --enable image
openstack endpoint create --region="RegionOne" image admin http://controller:9292
openstack endpoint create --region="RegionOne" image internal http://controller:9292
openstack endpoint create --region="RegionOne" image public http://controller:9292
