#!/bin/bash
mysql -u root --password=stack  < nova.sql
apt-get install -y nova-api nova-cert nova-conductor nova-consoleauth nova-scheduler nova-spiceproxy


openstack user create --project service --password nova nova
openstack role add --user nova --project service admin
openstack service create --description="Nova compute" --name="nova" compute

openstack endpoint create --region='RegionOne' \
nova admin "http://controller:8774/v2/%(tenant_id)s"

openstack endpoint create --region='RegionOne' \
nova internal "http://controller:8774/v2/%(tenant_id)s"

openstack endpoint create --region='RegionOne' \
nova public "http://controller:8774/v2/%(tenant_id)s"

service nova-api restart
service nova-conductor restart
service nova-scheduler restart
service nova-spiceproxy restart
