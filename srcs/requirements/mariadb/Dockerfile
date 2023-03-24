FROM debian:bullseye

RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN apt-get update -yq \
&& apt-get install mariadb-server -yq \
&& rm -rf /var/lib/apt/lists/*

COPY ./conf/init.sql /init.sql
COPY ./conf/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["mysqld", "--user=mysql", "--datadir=/var/lib/mysql", "--init-file=/init.sql"]
