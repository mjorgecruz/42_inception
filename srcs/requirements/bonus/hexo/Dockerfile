FROM debian:bullseye

RUN apt-get update && \
apt-get upgrade -y && apt-get install -y nodejs npm git-core
RUN npm install -g hexo-cli

RUN mkdir app
RUN hexo init /app
RUN cd /app && npm install
WORKDIR /app
EXPOSE 4000

RUN cp -R /app/node_modules/hexo-theme-landscape/source/css /
RUN cp -R /app/node_modules/hexo-theme-landscape/source/js /
RUN cp -R /app/node_modules/hexo-theme-landscape/source/fancybox /

CMD hexo server