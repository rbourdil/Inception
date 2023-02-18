FROM debian:bullseye-slim

RUN apt-get update -yq \
&& apt-get install mariadb-server -yq \
&& mysql_install_db --datadir=/home/rbourdil/data

COPY ./conf/mysql-init /var/lib/mysql/
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

EXPOSE 3306

CMD ["mysqld_safe", "--datadir=/home/rbourdil/data", "--bind-address=*", "--init-file=/var/lib/mysql/mysql-init"]
