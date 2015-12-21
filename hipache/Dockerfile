# build: docker build -t jbgo/hipache:latest .
# usage: docker run -d --name hipache --net=host -e REDIS_URL=redis://192.168.99.100:6379 jbgo/hipache
FROM debian:jessie

RUN \
  apt-get -y update && \
  apt-get -y install nodejs npm && \
  npm install eventemitter3@0.1.6 hipache@0.3.1 -g --production && \
  mkdir -p /var/log/hipache /usr/local/etc/hipache

env REDIS_URL redis://localhost:6379

ADD ./config.json /usr/local/etc/hipache/config.json
VOLUME /usr/local/etc/hipache

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 80

CMD ["/usr/local/bin/hipache", "-c", "/usr/local/etc/hipache/config.json"]
