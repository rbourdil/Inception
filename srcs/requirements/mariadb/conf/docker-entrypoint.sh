#!/bin/bash

if [[ ! -d /var/run/mysqld ]]; then
	mkdir -p /var/run/mysqld
fi

chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
chmod 777 /var/run/mysqld

find /etc/mysql/ -name '*.cnf' -print0 \
| xargs -0 grep -lZE '^(bind-address|log|user\s)' \
| xargs -rt -0 sed -Ei 's/^(bind-address|log|user\s)/#&/';

if [ -L /etc/mysql/my.cnf ]; then \
	sed -i -e '/includedir/ {N;s/\(.*\)\n\(.*\)/\n\2\n\1/}' /etc/mysql/mariadb.cnf; \
fi

if [[ ! -f /init.sql ]]; then

	cat >> /init.sql <<-EOF
		ALTER USER IF EXISTS 'root'@'${MARIADB_ROOT_HOST}' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';
		CREATE USER IF NOT EXISTS 'root'@'${MARIADB_ROOT_HOST}' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';
		GRANT ALL PRIVILEGES ON *.* TO 'root'@'${MARIADB_ROOT_HOST}';
		CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};
		CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'${MARIADB_HOST}' IDENTIFIED BY '${MARIADB_PASSWORD}';
		GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'${MARIADB_HOST}';
		FLUSH PRIVILEGES;
		EOF

fi	

mysql_install_db --user=mysql --datadir=/var/lib/mysql

exec "$@"
