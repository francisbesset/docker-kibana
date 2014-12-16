#!/bin/bash

for plugin in ${ELASTICSEARCH_PLUGINS}; do
    /usr/share/elasticsearch/bin/plugin -install ${plugin}
done

exec /usr/share/elasticsearch/bin/elasticsearch -p /var/run/elasticsearch/elasticsearch.pid \
    -Des.default.path.home=/usr/share/elasticsearch \
    -Des.default.path.logs=/var/log/elasticsearch \
    -Des.default.path.work=/tmp/elasticsearch \
    -Des.default.path.conf=/etc/elasticsearch
