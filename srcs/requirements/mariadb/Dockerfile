FROM debian:bullseye

RUN groupadd -g 999 mysql && useradd -g 999 -u 999 mysql

RUN apt-get update -yq \
&& apt-get install mariadb-server -yq \
&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld && chmod 777 /var/run/mysqld \
&& find /etc/mysql/ -name '*.cnf' -print0 \
| xargs -0 grep -lZE '^(bind-address|log|user\s)' \
| xargs -rt -0 sed -Ei 's/^(bind-address|log|user\s)/#&/' \
&& if [ -L /etc/mysql/my.cnf ]; then \
sed -i -e '/includedir/ {N;s/\(.*\)\n\(.*\)/\n\2\n\1/}' /etc/mysql/mariadb.cnf; fi

COPY ./conf/init.sql /home/init.sql

USER mysql 

RUN mysql_install_db

CMD ["mysqld", "--init-file=/home/init.sql"]
