#!/usr/bin/env sh

set -e

while ! nc -z elasticsearch5 9200; do
  sleep 0.2 # wait for 1/5 of the second before check again
done

while ! nc -z elasticsearch5 9300; do
  sleep 0.2 # wait for 1/5 of the second before check again
done

./bin/ycsb load elasticsearch -P workloads/workloada -p es.remote=true -p es.hosts.list=elasticsearch5:9300 -p es.newdb=true
./bin/ycsb run elasticsearch -P workloads/workloada -p es.remote=true -p es.hosts.list=elasticsearch5:9300

