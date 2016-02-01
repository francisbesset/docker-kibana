FROM nginx:1.9

# add our user and group first to make sure their IDs get assigned consistently
RUN groupadd -r kibana && useradd -r -m -g kibana kibana

ENV KIBANA_VERSION 3.1.3
ENV KIBANA_SHA1 50742908b9566a5ce17875d7b503b2fd35ec26d8

RUN apt-get update && apt-get install -y curl --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN set -x \
    && curl -fSL "https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}.tar.gz" -o kibana.tar.gz \
    && echo "${KIBANA_SHA1}  kibana.tar.gz" | sha1sum -c - \
    && mkdir -p /opt/kibana \
    && tar -xz --strip-components=1 -C /opt/kibana -f kibana.tar.gz \
    && sed -i 's/"http:\/\/"+window\.location\.hostname+":9200"/"http:\/\/"+window.location.hostname+":"+window.location.port/' /opt/kibana/config.js \
    && chown -R kibana:kibana /opt/kibana \
    && rm kibana.tar.gz

COPY ./kibana.vhost /etc/nginx/conf.d/kibana.template

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
