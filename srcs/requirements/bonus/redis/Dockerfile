FROM debian:bullseye

RUN apt-get update && \
apt-get upgrade -y && apt-get install -y redis-server php7.4-redis

COPY redis.conf /etc/redis/redis.conf

EXPOSE 6379

CMD ["redis-server", "/etc/redis/redis.conf"]