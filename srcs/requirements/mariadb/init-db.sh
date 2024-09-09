#!/bin/bash

cat << EOF > /etc/mysql/init.sql

CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE USER 'wp_user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_user'@'localhost';
FLUSH PRIVILEGES;
EOF
mysql install_db
mysqld --init-file=/etc/mysql/init.sql