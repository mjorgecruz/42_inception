FROM debian:bullseye
RUN apt update && apt upgrade -y && \
    apt install -y wordpress && \
    apt install -y php php php-fpm php-mysql php-gd php-curl php-xml php-mbstring

RUN mkdir -p /var/www/html

RUN chown -R www-data:www-data /var/www/html

RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /etc/php/7.4/fpm/php.ini && \
    sed -i 's/;listen.owner = www-data/listen.owner = www-data/' /etc/php/7.4/fpm/pool.d/www.conf && \
    sed -i 's/;listen.group = www-data/listen.group = www-data/' /etc/php/7.4/fpm/pool.d/www.conf && \
    sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf

WORKDIR /var/www/html

CMD ["php-fpm7.4", "-F"]

#COPY php.ini /etc/php/7.4/fpm/php.ini
#CMD sh


