#!/bin/sh

rc-service mariadb stop
rc-service mariadb start
mysql -h 127.0.0.1 --protocol=tcp -P 3306 -u root wordpress
# sleep infinity

