FROM kibana_base


# To download Elasticsearch GPG Key
RUN apt-get install -y ca-certificates wget

RUN \
        apt-get install -y nginx-light apache2-utils && \
    rm -f /etc/nginx/sites-enabled/default && \
    mkdir /var/www

ADD kibana.vhost /etc/nginx/sites-enabled/kibana

# Logstash dependency
RUN \
        wget -qO - https://download.elasticsearch.org/kibana/kibana/kibana-3.1.2.tar.gz | tar -C /opt -xvzf - && \
    ln -s /opt/kibana-3.1.2 /var/www/kibana && \
    sed -i 's/"http:\/\/"+window\.location\.hostname+":9200"/"http:\/\/"+window.location.hostname+":"+window.location.port/' /var/www/kibana/config.js

EXPOSE 80


ADD start.sh /
RUN chmod +x /start.sh

CMD [ "/start.sh" ]
