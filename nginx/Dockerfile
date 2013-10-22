FROM ubuntu:precise
RUN echo "deb http://archive.ubuntu.com/ubuntu/ precise universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y -q nginx
ADD ./nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
ENTRYPOINT nginx
