FROM debian:bullseye

RUN apt-get update && apt-get install nginx openssl -yq \
&& rm -rf /var/lib/apt/lists/*

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -batch \
&& chmod 400 /etc/ssl/private/nginx.key /etc/ssl/certs/nginx.crt \
&& unlink /etc/nginx/sites-available/default \
&& unlink /etc/nginx/sites-enabled/default

COPY ./conf/default /etc/nginx/sites-available/default

RUN ln --symbolic /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
