#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
mkdir /var/www
cd /var/www
wp core download --locale=ru_RU --allow-root
wp core config --dbname=$MYSQL_DB --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST --dbprefix=wp_ --allow-root
wp config set WP_HOME=$DOMAIN_NAME --allow-root
wp core install --url=$DOMAIN_NAME  --title="Это твой WP" --admin_user="acaryn" --admin_password=$ADMIN_PASSWORD --admin_email="admin@email.ru" --allow-root
wp user create user1 user1@email.ru --user_pass=$USER_PASSWORD --allow-root
wp user create user2 user2@email.ru --user_pass=$USER_PASSWORD --allow-root

sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php/7.3/fpm/php-fpm.conf
echo "listen = wordpress:9000" >> /etc/php/7.3/fpm/pool.d/www.conf

service php7.3-fpm stop