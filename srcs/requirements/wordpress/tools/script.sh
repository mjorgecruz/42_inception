#!/bin/bash

cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod 777 wp-cli.phar
sleep 5
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=${WORDPRESS_NAME} --dbuser=${WORDPRESS_USER} --dbpass=${WORDPRESS_PW} --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=localhost --title=inception --admin_user=${WORDPRESS_ADMIN} --admin_password=${WORDPRESS_ADMIN_PW} --admin_email=${WORDPRESS_ADMIN_EMAIL} --allow-root
./wp-cli.phar user create guest ${WORDPRESS_GUEST} --role=subscriber --user_pass=${WORDPRESS_GUEST_PW} --allow-root
chown -R www-data:www-data /var/www/html/wp-content/uploads
chown -R www-data:www-data /var/www/html
echo "define('FS_METHOD', 'direct');" >> /var/www/html/wp-config.php
php-fpm7.4 -F