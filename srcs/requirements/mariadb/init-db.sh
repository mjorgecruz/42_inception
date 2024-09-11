#!/bin/bash

cat << EOF > /etc/mysql/init.sql

CREATE DATABASE ${DATABASE_NAME} DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE USER '${DATABASE_USER}'@'%' IDENTIFIED BY '${DATABASE_PW}';
GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* TO '${DATABASE_USER}'@'%';
FLUSH PRIVILEGES;
EOF

chmod 777 /etc/mysql/init.sql

mysql install_db
mysqld --init-file=/etc/mysql/init.sql