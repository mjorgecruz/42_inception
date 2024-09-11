FROM debian:bullseye
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y wget

RUN mkdir -p /var/www/html/adminer && chown -R www-data:www-data /var/www/html/adminer
WORKDIR /var/www/html/adminer
CMD wget -O index.php https://github.com/vrana/adminer/releases/download/v4.7.8/adminer-4.7.8.php 