FROM debian:bullseye

RUN apt-get update && apt-get install php-fpm php-mysql mariadb-client curl sudo -yq \
&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/php \
&& sed -Ei 's/listen\s=.*/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& chmod +x wp-cli.phar \
&& mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

HEALTHCHECK --interval=10s --timeout=5s --start-period=2m \
	CMD ["/etc/init.d/php7.4-fpm", "status"]

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["php-fpm7.4", "--nodaemonize"]
