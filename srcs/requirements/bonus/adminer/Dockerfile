FROM debian:bullseye
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y wget \
    php7.4-fpm \
    php7.4-mysqli

RUN sed -i 's/;listen.owner = www-data/listen.owner = www-data/' /etc/php/7.4/fpm/pool.d/www.conf && \
    sed -i 's/;listen.group = www-data/listen.group = www-data/' /etc/php/7.4/fpm/pool.d/www.conf && \
    sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = adminer:9000/' /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /var/www/html/adminer && chown -R www-data:www-data /var/www/html/adminer
RUN mkdir -p /run/php && chown -R www-data:www-data /run/php
WORKDIR /var/www/html/adminer

RUN wget -O index.php https://github.com/vrana/adminer/releases/download/v4.7.8/adminer-4.7.8.php 
RUN chmod 777 index.php
EXPOSE 9000

CMD ["php-fpm7.4", "-F"]