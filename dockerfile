FROM nginx
# 作者
# MAINTAINER songxiaoguang
# 首先删除 nginx default.conf 文件
# RUN rm /etc/nginx/conf.d/default.conf
# 用本地的 default.conf 替换 nginx 镜像的默认配置
# ADD default.conf /etc/nginx/conf.d/

# 将项目打包后的 dist 目录，拷贝到 default.conf 指定的发布目录 
COPY _site /usr/share/nginx/html/

docker run -d --name jekyll-container -p 8001:80 -v -v /mydata/nginx/www/:/usr/share/nginx/html/_site jekll