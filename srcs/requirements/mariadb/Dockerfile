FROM debian:bullseye
RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server mariadb-client -y

COPY ./init-db.sh /init-db.sh

EXPOSE 3306

RUN chmod +x /init-db.sh
CMD bash -c /init-db.sh