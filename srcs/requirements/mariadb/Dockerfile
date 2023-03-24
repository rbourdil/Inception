FROM debian:bullseye

RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN apt-get update -yq \
&& apt-get install mariadb-server -yq \
&& rm -rf /var/lib/apt/lists/*

COPY ./conf/init.sql /home/init.sql
COPY ./conf/docker-entrypoint.sh /home/docker-entrypoint.sh

ENTRYPOINT ["/home/docker-entrypoint.sh"]

CMD ["mysqld", "--user=mysql", "--datadir=/var/lib/mysql", "--init-file=/home/init.sql"]
