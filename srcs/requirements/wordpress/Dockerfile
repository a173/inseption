FROM debian:buster

RUN apt-get update
RUN apt-get -y install php7.3-fpm php-fpm php-mysql
RUN apt-get -y install php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip php-mbstring php-phar
RUN apt-get -y install wget curl mariadb-client

RUN mkdir -p /run/php
COPY tools/start.sh .

CMD ["bash", "start.sh"]
CMD ["php-fpm7.3", "-F"]