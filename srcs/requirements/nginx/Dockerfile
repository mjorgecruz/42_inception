FROM debian:bullseye

RUN apt-get update && apt-get upgrade && apt-get install -y nginx && apt-get install -y nginx-core apt-get install openssl
RUN --mount=type=secret,id=mysecret, target=/var/secrets
COPY nginx.conf /etc/nginx

RUN nginx

EXPOSE 80

RUN openssl genrsa -des3 -out myhostname.key 2048 --passwd 
RUN 
