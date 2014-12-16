FROM kibana_base

RUN apt-get install -y redis-server

RUN \
    sed -i 's/daemonize yes/daemonize no/' /etc/redis/redis.conf && \
    sed -i 's/bind 127\.0\.0\.1/bind 0.0.0.0/' /etc/redis/redis.conf

EXPOSE 6379


ADD start.sh /
RUN chmod +x /start.sh

CMD [ "/start.sh" ]
