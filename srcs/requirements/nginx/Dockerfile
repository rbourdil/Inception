FROM debian:bullseye-slim

RUN apt-get update -yq \
&& apt-get install nginx openssl -yq \
&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -batch

COPY nginx.conf /etc/nginx/
COPY test.conf /etc/nginx/conf.d/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
