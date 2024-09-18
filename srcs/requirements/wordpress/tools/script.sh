#!/bin/bash

cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod 777 wp-cli.phar

./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=${WORDPRESS_NAME} --dbuser=${WORDPRESS_USER} --dbpass=${WORDPRESS_PW} --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=localhost --title=inception --admin_user=${WORDPRESS_ADMIN} --admin_password=${WORDPRESS_ADMIN_PW} --admin_email=${WORDPRESS_ADMIN_EMAIL} --allow-root
./wp-cli.phar user create guest ${WORDPRESS_GUEST} --role=subscriber --user_pass=${WORDPRESS_GUEST_PW} --user_email=${WORDPRESS_ADMIN_EMAIL} --allow-root

./wp-cli.phar config set WP_CACHE_KEY_SALT 'string' --type=constant --allow-root
./wp-cli.phar config set WP_CACHE true --type=constant --raw --allow-root
./wp-cli.phar config set WP_REDIS_HOST redis --type=constant --allow-root
./wp-cli.phar config set WP_REDIS_PORT 6379 --type=constant --raw --allow-root

chown -R www-data:www-data /var/www/html/wp-content/uploads
chown -R www-data:www-data /var/www/html

echo "define('FS_METHOD', 'direct');" >> /var/www/html/wp-config.php
./wp-cli.phar plugin install redis-cache --activate --allow-root
./wp-cli.phar redis enable --allow-root

php-fpm7.4 -F