MARIADB_IMAGE=mariadb-image
WORDPRESS_IMAGE=wordpress-image
NGINX_IMAGE=nginx-image

MARIADB_HOST=mariadb1
WORDPRESS_HOST=wordpress1
NGINX_HOST=nginx1

docker run -p 3306:3306 -d -v mdb:/home/rbourdil/data --name ${MARIADB_HOST} --network mynet --hostname ${MARIADB_HOST} ${MARIADB_IMAGE}
docker run -p 9000:9000 -d --name ${WORDPRESS_HOST} --network mynet --hostname ${WORDPRESS_HOST} ${WORDPRESS_IMAGE}
docker run -p 80:80 -d --name ${NGINX_HOST} --network mynet --hostname ${NGINX_HOST} ${NGINX_IMAGE}
