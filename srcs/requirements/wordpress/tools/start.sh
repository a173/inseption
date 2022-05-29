#!/bin/sh

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
mkdir /var/www
cd /var/www
wp core download --locale=ru_RU --allow-root
wp core config --dbname=$MYSQL_DB --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST --dbprefix=wp_ --allow-root
wp core install --url=$DOMAIN_NAME  --title=$WP_TITLE --admin_user=$ADMIN_USERNAME --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root
wp user create $USER_USERNAME_1 $USER_EMAIL_1 --user_pass=$USER_PASSWORD --allow-root
wp user create $USER_USERNAME_2 $USER_EMAIL_2 --user_pass=$USER_PASSWORD --allow-root
sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php/7.3/fpm/php-fpm.conf
echo "listen = wordpress:9000" >> /etc/php/7.3/fpm/pool.d/www.conf

/usr/sbin/php-fpm7.3 --nodaemonize