FROM debian:bullseye
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y vsftpd openssl

RUN mkdir -p /var/run/vsftpd/empty && chmod 755 /var/run/vsftpd/empty
RUN mkdir -p var/www/html && chmod a-w /var/www/html
RUN useradd -d /var/www/html ftp_user && echo "ftp_user:ftp_password" | chpasswd

RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/certs/ftp.key \ 
    -out /etc/ssl/certs/ftp.crt \
    -subj "/CN=localhost"
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE 20 21
#  ./bin/start_vsftpd.sh 

CMD vsftpd /etc/vsftpd/vsftpd.conf
