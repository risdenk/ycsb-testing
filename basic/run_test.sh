#!/usr/bin/env sh

set -e

./bin/ycsb load basic -P workloads/workloada
./bin/ycsb run basic -P workloads/workloada
