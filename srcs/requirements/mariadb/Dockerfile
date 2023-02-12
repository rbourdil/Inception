FROM debian:bullseye

RUN apt update \
&& apt install mariadb-server -yq

CMD ["mysqld_safe"]
