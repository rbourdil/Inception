#!/bin/bash

if [[ ! -d /srv/www/wordpress ]]; then
	chown www-data: /srv/www
	curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www

	cat >> /srv/www/wordpress/wp-config.php <<-EOF
		<?php
		define( 'DB_NAME', '${MARIADB_DATABASE}' );
		define( 'DB_USER', '${MARIADB_USER}' );
		define( 'DB_PASSWORD', '${MARIADB_PASSWORD}' );
		define( 'DB_HOST', 'mariadb' );
		define( 'DB_CHARSET', 'utf8' );
		define( 'DB_COLLATE', '' );
		define( 'AUTH_KEY', '${AUTH_KEY}');
		define( 'SECURE_AUTH_KEY', '${SECURE_AUTH_KEY}');
		define( 'LOGGED_IN_KEY', '${LOGGED_IN_KEY}');
		define( 'NONCE_KEY', '${NONCE_KEY}');
		define( 'AUTH_SALT', '${AUTH_SALT}');
		define( 'SECURE_AUTH_SALT', '${SECURE_AUTH_SALT}');
		define( 'LOGGED_IN_SALT', '${LOGGED_IN_SALT}');
		define( 'NONCE_SALT', '${NONCE_SALT}');
		\$table_prefix = 'wp_';
		define( 'WP_DEBUG', false );
		if ( ! defined( 'ABSPATH' ) ) { define( 'ABSPATH', __DIR__ . '/' ); }
		require_once ABSPATH . 'wp-settings.php';
		EOF

fi

exec "$@"
