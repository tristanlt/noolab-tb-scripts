#!/bin/bash
mysql -u root --password=stack  < keystone.sql
apt-get -y install keystone python-keystoneclient python-mysqldb python-openstackclient
cp keystone.conf /etc/keystone/
sudo -u keystone keystone-manage db_sync
echo "ServerName controller" >> /etc/apache2/apache2.conf
service apache2 restart
keystone-manage bootstrap --bootstrap-username cloudadmin \
                          --bootstrap-password cloudadmin \
                          --bootstrap-project-name cloudadmin \
                          --bootstrap-admin-url http://controller:35357/v3/ \
                          --bootstrap-internal-url http://controller:35357/v3/ \
                          --bootstrap-public-url http://controller:35357/v3/ \
                          --bootstrap-region-id RegionOne
