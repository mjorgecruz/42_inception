#!/bin/bash
# mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html
# mkdir -p /run/php && chown -R www-data:www-data /run/php

# chown -R www-data:www-data /var/www/html
# chmod -R 755 /var/www/html

# php-fpm7.4 -F


cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod 777 wp-cli.phar
sleep 5
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=wordpress --dbuser=wp_user --dbpass=password --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root
./wp-cli.phar user create guest guest@guest.com --role=subscriber --user_pass=guest123 --allow-rootphp
chown -R www-data:www-data /var/www/html/wp-content/uploads
chown -R www-data:www-data /var/www/html
# echo "define('FS_METHOD', 'direct');" >> /var/www/html/wp-config.php
php-fpm7.4 -F