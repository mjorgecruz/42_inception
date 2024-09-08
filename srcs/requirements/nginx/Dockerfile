FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y &&\
    apt-get install -y nginx nginx-core openssl
COPY nginx.conf /etc/nginx/nginx.conf
COPY tools/masoares.42.fr+1.pem /etc/nginx/ssl/masoares.42.fr+1.pem
COPY tools/masoares.42.fr+1-key.pem /etc/nginx/ssl/masoares.42.fr+1-key.pem
COPY tools /usr/share/nginx/html

# RUN nginx

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]