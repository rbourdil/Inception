FROM debian:bullseye

RUN apt-get update && apt-get install php-fpm php-mysql curl sudo -yq \
&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/php \
&& sed -Ei 's/listen\s=.*/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf

COPY ./conf/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["php-fpm7.4", "--nodaemonize"]
