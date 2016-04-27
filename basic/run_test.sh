#!/usr/bin/env sh

./bin/ycsb load basic -P workloads/workloada
./bin/ycsb run basic -P workloads/workloada
