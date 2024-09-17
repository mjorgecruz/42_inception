FROM debian:bullseye

RUN apt-get update && \
apt-get upgrade -y && apt-get install -y nodejs npm git-core
RUN npm install -g hexo-cli

RUN mkdir app
RUN hexo init /app
RUN cd /app && npm install
WORKDIR /app
COPY _config.yml /app/_config.yml
EXPOSE 4000

CMD hexo server