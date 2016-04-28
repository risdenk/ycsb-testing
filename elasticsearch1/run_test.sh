#!/usr/bin/env sh

set -e

while ! nc -z elasticsearch1 9200; do
  sleep 0.2 # wait for 1/5 of the second before check again
done

while ! nc -z elasticsearch1 9300; do
  sleep 0.2 # wait for 1/5 of the second before check again
done

./bin/ycsb load elasticsearch -P workloads/workloada -p es.remote=true -p es.hosts.list=elasticsearch1:9300 -p es.newdb=true
./bin/ycsb run elasticsearch -P workloads/workloada -p es.remote=true -p es.hosts.list=elasticsearch1:9300

