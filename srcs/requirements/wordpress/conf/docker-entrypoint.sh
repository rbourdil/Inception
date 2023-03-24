#!/bin/bash

if [[ ! -d /srv/www/wordpress ]]; then
	chown www-data: /srv/www
	curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www
	mv /wp-config.php /srv/www/wordpress/
	rm -f /wp-config.php
fi

exec "$@"
