#!/bin/bash

# Requirepass
if [ -n "${REDIS_PASSWORD}" ]; then
    sed -i "/# requirepass foobared/a requirepass \"${REDIS_PASSWORD/\"/\\\\\"}\"" /etc/redis/redis.conf
fi

exec /usr/bin/redis-server /etc/redis/redis.conf
