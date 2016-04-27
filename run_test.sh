#!/usr/bin/env bash

docker-compose run --rm ycsb /data/basic/run_test.sh

docker-compose up -d aerospike
docker-compose run --rm ycsb /data/aerospike/run_test.sh
docker-compose down -v
