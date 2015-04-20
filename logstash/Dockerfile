FROM kibana_base


# To download Elasticsearch GPG Key
RUN apt-get install -y wget


# Logstash dependency
RUN apt-get install -y openjdk-7-jre-headless

# Logstash
RUN \
        wget -qO - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add - && \
    echo "deb http://packages.elasticsearch.org/logstash/1.4/debian stable main" > /etc/apt/sources.list.d/logstash.list && \
    apt-get update && \
    apt-get install -y logstash

# Logstash
ADD logstash.conf /etc/logstash/logstash.conf


ADD start.sh /
RUN chmod +x /start.sh

CMD [ "/start.sh"]
