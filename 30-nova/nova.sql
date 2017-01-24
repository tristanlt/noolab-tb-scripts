create database nova;
create database nova_api;
grant all privileges on nova_api.* to 'nova'@'localhost' identified by 'nova';
grant all privileges on nova_api.* to 'nova'@'%' identified by 'nova';
GRANT ALL PRIVILEGES ON nova.* TO 'nova'@'localhost' IDENTIFIED BY 'nova';
GRANT ALL PRIVILEGES ON nova.* TO 'nova'@'%' IDENTIFIED BY 'nova';
flush privileges;

