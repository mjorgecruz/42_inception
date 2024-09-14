FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y &&\
    apt-get install -y openssl nginx

RUN mkdir -p var/www/html/static && chmod a-w /var/www/html
COPY ./tools /var/www/html/static
RUN chmod -R 755 /var/www/html/static

RUN mkdir -p /etc/ssl/certs && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/certs/ftp.key \ 
    -out /etc/ssl/certs/ftp.crt \
    -subj "/CN=localhost"

RUN echo 'server { \
    listen 10000; \
    server_name localhost; \
    location / { \
        root /var/www/html/static; \
        index static.html; \
    } \
}' > /etc/nginx/sites-available/default

EXPOSE 10000

CMD ["nginx", "-g", "daemon off;"]