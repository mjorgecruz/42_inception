FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y &&\
    apt-get install -y nginx nginx-core openssl
COPY nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/CN=localhost"


COPY nginx.conf /etc/nginx/sites-available/default
# COPY tools /usr/share/nginx/html

# RUN nginx

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]