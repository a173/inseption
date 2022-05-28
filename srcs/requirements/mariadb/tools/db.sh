#!/bin/bash

if [ ! -d /var/lib/mysql/wordpress ] ; then
	service mysql start
	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DB;" | mysql -u root --skip-password
	echo "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
	      GRANT ALL ON *.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION;
	      FLUSH PRIVILEGES;" | mysql -u root --skip-password
  echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${MYSQL_ROOT_PASSWORD}')" | mysql -u root --skip-password
  service mysql stop
fi