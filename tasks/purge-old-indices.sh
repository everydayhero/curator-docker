#!/bin/bash

if [ -n "$MAX_INDEX_AGE" ]; then
  /usr/bin/curator --host $ELASTICSEARCH_HOST delete indices --older-than $MAX_INDEX_AGE --time-unit days --prefix logstash
else
  echo "Skip purging old indices. MAX_INDEX_AGE is not set."
fi
