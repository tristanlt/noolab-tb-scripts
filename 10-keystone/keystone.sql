CREATE DATABASE keystone;
GRANT ALL PRIVILEGES on keystone.* TO 'keystone'@'localhost' IDENTIFIED BY 'keystone';
GRANT ALL PRIVILEGES on keystone.* TO 'keystone'@'%' IDENTIFIED BY 'keystone';
flush privileges;

