FROM debian:bullseye-slim

RUN apt-get update -yq \
&& apt-get install php-fpm curl sudo -yq \
&& mkdir -p /srv/www \
&& chown www-data: /srv/www \
&& curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www \

CMD ["bash"]
