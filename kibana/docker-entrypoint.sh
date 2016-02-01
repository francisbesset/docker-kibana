#!/bin/bash

envsubst < /etc/nginx/conf.d/kibana.template > /etc/nginx/conf.d/default.conf
sed -i 's/tcp/http/' /etc/nginx/conf.d/default.conf

exec "$@"
