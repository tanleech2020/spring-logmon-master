#!/bin/bash
set -e

mkdir -p /usr/share/elasticsearch/data
chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/data

exec su elasticsearch -c "/usr/local/bin/docker-entrypoint.sh elasticsearch"
