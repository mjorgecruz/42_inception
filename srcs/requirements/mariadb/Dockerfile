FROM debian:bullseye
RUN apt update && apt upgrade -y && apt install -y mariadb_server mariadb_client

COPY ./init-db.sql /docker-entrypoint-initdb.d/

EXPOSE 3306

CMD ["mysqld_safe", "--init-file=/docker-entrypoint-initdb.d/init-db.sql"]