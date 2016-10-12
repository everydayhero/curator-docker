This docker image runs curator tasks against an elasticsearch cluster to manage its indices.

The list of tasks currently are:
* purge old logstash indices (when MAX_INDEX_AGE is set)
* optimise logstash indices that are a day old or more

## Configuration

`ELASTICSEARCH_HOST` - The hostname or IP address of an elasticsearch cluster. (Required)

`MAX_INDEX_AGE` - The maximum age (in days) a logstash index can be until it is deleted. (Required)

`ELASTICSEARCH_PORT` - Specify the instance port. If not set default is 9200.

`USE_SSL` - set to true and specify the correct port with `ELASTICSEARCH_PORT`
