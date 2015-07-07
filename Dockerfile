FROM gliderlabs/alpine:3.2

ENV CURATOR_VERSION 3.2.0
ENV ELASTICSEARCH_PORT 9200

RUN apk --update add python py-pip bash && pip install elasticsearch-curator==$CURATOR_VERSION

ADD docker-entrypoint.sh /
ADD tasks/optimize-indices.sh /etc/periodic/
ADD tasks/purge-old-indices.sh /etc/periodic/

RUN echo "0 2 * * * run-parts /etc/periodic/purge-old-indices.sh" >> /etc/crontabs/root
RUN echo "0 2 * * * run-parts /etc/periodic/optimize-indices.sh" >> /etc/crontabs/root

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["crond", "-f", "-l", "8"]
