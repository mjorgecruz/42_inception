FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y &&\
    apt-get install -y openssl nginx

RUN mkdir -p var/www/html/static && chmod a-w /var/www/html/static
COPY ./tools /var/www/html/static
RUN chmod -R 755 /var/www/html/static

RUN echo 'server { \
    listen 10000; \
    server_name localhost; \
    location / { \
        root /var/www/html/static; \
        index index.html; \
    } \
}' > /etc/nginx/sites-available/default

EXPOSE 10000

CMD ["nginx", "-g", "daemon off;"]