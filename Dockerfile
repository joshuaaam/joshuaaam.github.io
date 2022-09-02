# FROM nginx

# 将项目打包后的 dist 目录，拷贝到 default.conf 指定的发布目录 
# COPY _site/ /usr/share/nginx/html/
# 作者
# MAINTAINER songxiaoguang
# 首先删除 nginx default.conf 文件
# RUN rm /etc/nginx/conf.d/default.conf
# 用本地的 default.conf 替换 nginx 镜像的默认配置
# ADD default.conf /etc/nginx/conf.d/

FROM ubuntu:latest
MAINTAINER Bourbon Tian "bourbon@1mcloud.com"
ENV REFRESHED_AT 2017-06-13

RUN apt-get -qq update
RUN apt-get -qq install ruby ruby-dev build-essential nodejs
RUN gem install --no-rdoc --no-ri jekyll -v 2.5.3

VOLUME /data
VOLUME /var/www/html
WORKDIR /data

ENTRYPOINT [ "jekyll", "build", "--destination=/var/www/html" ]
