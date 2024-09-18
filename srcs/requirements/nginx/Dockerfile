FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y &&\
    apt-get install -y nginx nginx-core openssl

RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key\
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/CN=localhost"


COPY nginx.conf /etc/nginx/sites-available/default

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]