#!/usr/bin/env sh

set -e

while ! nc -z couchbase4 8091; do
  sleep 0.2 # wait for 1/5 of the second before check again
done

./bin/ycsb load couchbase -P workloads/workloada -p couchbase.url=http://couchbase4:8091/pools
./bin/ycsb run couchbase -P workloads/workloada -p couchbase.url=http://couchbase4:8091/pools

#./bin/ycsb load couchbase2 -P workloads/workloada -p couchbase.host=couchbase4
#./bin/ycsb run couchbase2 -P workloads/workloada -p couchbase.host=couchbase4
