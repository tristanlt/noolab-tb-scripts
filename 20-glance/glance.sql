CREATE DATABASE glance;
GRANT ALL PRIVILEGES on glance.* TO 'glance'@'localhost' IDENTIFIED BY 'glance';
GRANT ALL PRIVILEGES on glance.* TO 'glance'@'%' IDENTIFIED BY 'glance';
flush privileges;
