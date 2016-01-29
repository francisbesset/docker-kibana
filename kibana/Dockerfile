FROM kibana:4.3

ENV KIBANA_VERSION 5.0.0-snapshot

RUN set -x \
    && curl -fSL "http://download.elastic.co/kibana/kibana-snapshot/kibana-${KIBANA_VERSION}-linux-x64.tar.gz" -o kibana.tar.gz \
    && rm -rf /opt/kibana && mkdir -p /opt/kibana \
    && tar -xz --strip-components=1 -C /opt/kibana -f kibana.tar.gz \
    && chown -R kibana:kibana /opt/kibana \
    && rm kibana.tar.gz
