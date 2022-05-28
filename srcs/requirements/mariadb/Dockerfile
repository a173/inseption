FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server

RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY /conf/50-server.cnf /etc/mysql/mariadb.conf.d
COPY /tools/db.sh .

CMD ["bash", "db.sh"]
CMD ["mysqld", "-u", "root" ]