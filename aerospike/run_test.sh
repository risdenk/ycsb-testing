#!/usr/bin/env sh

while ! nc -z aerospike 3000; do   
  sleep 0.2 # wait for 1/5 of the second before check again
done

./bin/ycsb load aerospike -P workloads/workloada -p as.host=aerospike -p as.namespace=test
./bin/ycsb run aerospike -P workloads/workloada -p as.host=aerospike -p as.namespace=test
