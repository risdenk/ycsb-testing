#!/usr/bin/env bash

set -e

while ! nc -z couchbase2 8091; do
  sleep 0.2 # wait for 1/5 of the second before check again
done

/opt/couchbase/bin/couchbase-cli cluster-init -c couchbase2 --cluster-init-username=admin --cluster-init-password=password --cluster-init-ramsize=256 -u admin -p password
/opt/couchbase/bin/couchbase-cli bucket-create -c couchbase2 --bucket=default --bucket-type=couchbase --bucket-port=11211 --bucket-ramsize=256 -u admin -p password

sleep 10
