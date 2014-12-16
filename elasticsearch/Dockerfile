FROM kibana_base


# install ca-certificates and wget
RUN apt-get install -y ca-certificates wget


# Java
RUN apt-get install -y openjdk-7-jre-headless


# Elasticsearch
RUN \
        wget -qO - https://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add - && \
    echo "deb http://packages.elasticsearch.org/elasticsearch/1.4/debian stable main" >> /etc/apt/sources.list.d/elasticsearch.list && \
    apt-get update && \
    apt-get install -y elasticsearch


RUN \
    sed -i '/#cluster.name:.*/a cluster.name: logstash' /etc/elasticsearch/elasticsearch.yml && \
    sed -i '/#discovery.zen.ping.multicast.enabled: false/a discovery.zen.ping.multicast.enabled: false' /etc/elasticsearch/elasticsearch.yml && \
    sed -i '/#index.number_of_shards: 5/a index.number_of_shards: 1' /etc/elasticsearch/elasticsearch.yml && \
    sed -i '/#index.number_of_replicas: 1/a index.number_of_replicas: 0' /etc/elasticsearch/elasticsearch.yml && \
    echo "script.disable_dynamic: true" >> /etc/elasticsearch/elasticsearch.yml && \
    echo "http.cors.enabled: true" >> /etc/elasticsearch/elasticsearch.yml


# Elasticsearch ports
EXPOSE 9200 9300


ADD start.sh /
RUN chmod +x /start.sh

CMD [ "/start.sh" ]
