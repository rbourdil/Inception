FROM debian:bullseye-slim

RUN apt-get update -yq \
&& apt-get install php-fpm php-mysql curl sudo -yq

RUN mkdir -p /srv/www /run/php \
&& chown www-data: /srv/www \
&& curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www \
&& touch /var/log/fpm-php.www.log \
&& chmod 666 /var/log/fpm-php.www.log

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
COPY ./conf/wp-config.php /srv/www/wordpress/
COPY ./conf/php.ini /etc/php/7.4/fpm/

EXPOSE 9000

CMD ["php-fpm7.4", "--nodaemonize"]
