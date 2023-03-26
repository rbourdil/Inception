FROM debian:bullseye

RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN apt-get update -yq \
&& apt-get install mariadb-server -yq \
&& rm -rf /var/lib/apt/lists/*

COPY ./conf/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

HEALTHCHECK --interval=15s --timeout=5s --start-period=30s \
	CMD ["mysqladmin", "ping"]

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["mysqld", "--user=mysql", "--datadir=/var/lib/mysql", "--init-file=/init.sql"]
