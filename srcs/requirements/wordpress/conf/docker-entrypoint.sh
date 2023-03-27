#!/bin/bash

if [[ ! -d /srv/www/wordpress ]]; then

	mkdir -p /srv/www/wordpress
	chown -R www-data: /srv/www
	sudo -u www-data wp core download --path=/srv/www/wordpress

fi

if [[ ! -f /srv/www/wordpress/wp-config.php ]]; then

	sudo -u www-data wp config create --dbname=${MARIADB_DATABASE} --dbuser=${MARIADB_USER} --dbpass=${MARIADB_PASSWORD} --dbhost=mariadb --path=/srv/www/wordpress

fi

if ! sudo -u www-data wp core is-installed --path=/srv/www/wordpress; then

	sudo -u www-data wp core install --url=rbourdil.42.fr --title=inception --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWD} --admin_email="${WP_ADMIN_USER}@wp.fr" --path=/srv/www/wordpress
	sudo -u www-data wp user create ${WP_COMMON_USER} "${WP_COMMON_USER}@wp.fr" --user_pass=${WP_COMMON_PASSWD} --path=/srv/www/wordpress

fi

exec "$@"
