FROM debian:bullseye-slim

RUN apt-get update -yq \
&& apt-get install nginx openssl -yq \
&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -batch

COPY ./conf/nginx.conf /etc/nginx/
COPY ./conf/test1.conf /etc/nginx/conf.d/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
