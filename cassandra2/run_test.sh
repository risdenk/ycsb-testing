#!/usr/bin/env sh

set -e

while ! nc -z cassandra2 9042; do
  sleep 0.2 # wait for 1/5 of the second before check again
done

./bin/ycsb load cassandra2-cql -P workloads/workloada -p hosts=cassandra2
./bin/ycsb run cassandra2-cql -P workloads/workloada -p hosts=cassandra2
