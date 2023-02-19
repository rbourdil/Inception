FROM debian:bullseye-slim

RUN apt-get update -yq \
&& apt-get install mariadb-server -yq

COPY ./conf/mysql-init /var/lib/mysql/

RUN mkdir -p /var/lib/mysql /run/mysqld \
&& chmod 777 /run/mysqld

EXPOSE 3306

CMD ["mysqld", "--bind-address=*", "--init-file=/var/lib/mysql/mysql-init"]
