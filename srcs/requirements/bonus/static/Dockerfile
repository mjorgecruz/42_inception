FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y &&\
    apt-get install -y openssl nginx

    
    RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key\
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/CN=localhost"
    
RUN mkdir -p var/www/html
COPY ./tools /var/www/html
RUN chmod -R 755 /var/www/html

RUN echo 'server { \
    listen 10000 ssl;  \
    server_name masoares.42.fr www.masoares.42.fr; \
    ssl_protocols TLSv1.2 TLSv1.3; \
	ssl_certificate /etc/nginx/ssl/nginx.crt; \
	ssl_certificate_key /etc/nginx/ssl/nginx.key;\
    root /var/www/html; \
    index index.html; \
}' > /etc/nginx/sites-available/default

EXPOSE 2053

CMD ["nginx", "-g", "daemon off;"]