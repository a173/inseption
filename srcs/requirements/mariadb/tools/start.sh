#!/bin/sh

openrc
touch /run/openrc/softlevel
rc-service mariadb setup
rc-service mariadb start
if [ ! -d /var/lib/mysql/$MYSQL_DB ] ; then
  mysql -u root --skip-password -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DB;"
  mysql -u root --skip-password -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
  mysql -u root --skip-password -e "GRANT ALL PRIVILEGES ON $MYSQL_DB.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;"
  mysql -u root --skip-password -e "FLUSH PRIVILEGES;"
fi
rc-service mariadb stop

sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*skip-networking.*|skip-networking=false|g" /etc/my.cnf.d/mariadb-server.cnf

mysqld -u root --datadir=/var/lib/mysql/