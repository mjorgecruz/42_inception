# FROM debian:bullseye
# RUN apt update && apt upgrade -y && \
#     apt install -y wordpress && \
#     apt install -y php php php-fpm php-mysql php-gd php-curl php-xml php-mbstring curl

FROM debian:bullseye
RUN apt update && apt upgrade -y && apt install -y \
    php7.4-fpm \
    php7.4-mysqli \
    curl
# RUN sed -i 's/;listen.owner = www-data/listen.owner = www-data/' /etc/php/7.4/fpm/pool.d/www.conf && \
#     sed -i 's/;listen.group = www-data/listen.group = www-data/' /etc/php/7.4/fpm/pool.d/www.conf && \
#     sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = wordpress:9000/' /etc/php/7.4/fpm/pool.d/www.conf
COPY tools/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./tools/script.sh /script.sh
RUN chmod +x /script.sh
RUN mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html
RUN mkdir -p /run/php && chown -R www-data:www-data /run/php
RUN mkdir -p /var/www/html/wp-content/uploads && chown -R www-data:www-data /var/www/html/wp-content/uploads
# ENTRYPOINT ["./script.sh"]

    
# RUN mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html
# RUN mkdir -p /run/php && chown -R www-data:www-data /run/php
# COPY ./tools/script.sh script.sh

# # RUN chown -R www-data:www-data /var/www/html
# RUN chmod 755 script.sh

WORKDIR /var/www/html

CMD sh /script.sh


