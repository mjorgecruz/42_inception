FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y &&\
    apt-get install -y nginx nginx-core openssl
# RUN --mount=type=secret,id=mysecret, target=/var/secrets
COPY nginx.conf /etc/nginx/nginx.conf
COPY tools tools

# RUN nginx

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]