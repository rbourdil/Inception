FROM debian:bullseye-slim

RUN apt-get update -yq \
&& apt-get install mariadb-server -yq

EXPOSE 3306

CMD ["mysqld_safe"]
