#!/bin/bash

# Redis password
if [ -n "${REDIS_PASSWORD}" ]; then
    sed -i "/  redis [{]/a \ \ \ \ password => '${REDIS_PASSWORD}'" /etc/logstash/logstash.conf
fi

exec /opt/logstash/bin/logstash agent -f /etc/logstash/logstash.conf
