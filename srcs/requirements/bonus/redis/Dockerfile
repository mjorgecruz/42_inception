FROM debian:bullseye

RUN apt-get update && \
apt-get upgrade -y && apt-get install -y curl
RUN curl -fsSL https://packages.redis.io/gpg | gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
RUN chmod 644 /usr/share/keyrings/redis-archive-keyring.gpg
RUN "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list
RUN apt-get update && apt-get upgrade -y && apt-get install -y openssl redis-server gpg lsb-release 

RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/certs/ftp.key \ 
    -out /etc/ssl/certs/ftp.crt \
    -subj "/CN=localhost"

COPY redis.conf /etc/redis/redis.conf

EXPOSE 6379

VOLUME /data

CMD ["redis-server", "/etc/redis/redis.conf"]