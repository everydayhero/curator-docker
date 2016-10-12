FROM gliderlabs/alpine:latest

ENV CURATOR_VERSION 3.5.1
ENV ELASTICSEARCH_PORT 9200

RUN apk --update add python py-pip bash && pip install elasticsearch-curator==$CURATOR_VERSION

ADD docker-entrypoint.sh /
ADD tasks/optimize-indices.sh /etc/periodic/
ADD tasks/purge-old-indices.sh /etc/periodic/

RUN printf "\n0\t2\t*\t*\t*\t/etc/periodic/purge-old-indices.sh" >> /etc/crontabs/root
RUN printf "\n0\t2\t*\t*\t*\t/etc/periodic/optimize-indices.sh" >> /etc/crontabs/root

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["crond", "-f", "-l", "8"]
