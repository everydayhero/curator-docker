#!/bin/bash
if [ -n "$USE_SSL" ]; then
    curator --host $ELASTICSEARCH_HOST --port $ELASTICSEARCH_PORT --use_ssl optimize --max_num_segments 1 indices --prefix logstash --older-than 1 --time-unit days --timestring '%Y.%m.%d'
else
    curator --host $ELASTICSEARCH_HOST --port $ELASTICSEARCH_PORT optimize --max_num_segments 1 indices --prefix logstash --older-than 1 --time-unit days --timestring '%Y.%m.%d'
fi
