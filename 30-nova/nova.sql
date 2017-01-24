create database nova;
create database nova_api;
GRANT ALL PRIVILEGES ON nova.* TO 'nova_api'@'localhost' \
IDENTIFIED BY 'nova';
GRANT ALL PRIVILEGES ON nova.* TO 'nova_api'@'%' \
IDENTIFIED BY 'nova';
GRANT ALL PRIVILEGES ON nova.* TO 'nova'@'localhost' \
IDENTIFIED BY 'nova';
GRANT ALL PRIVILEGES ON nova.* TO 'nova'@'%' \
IDENTIFIED BY 'nova';
flush privileges;

