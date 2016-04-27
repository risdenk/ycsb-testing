#!/usr/bin/env sh

while ! nc -z cassandra3 9042; do
  sleep 0.2 # wait for 1/5 of the second before check again
done

./bin/ycsb load cassandra2-cql -P workloads/workloada -p hosts=cassandra3
./bin/ycsb run cassandra2-cql -P workloads/workloada -p hosts=cassandra3
