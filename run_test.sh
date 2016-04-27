#!/usr/bin/env bash

docker-compose up -d basic
docker-compose run --rm ycsb /data/basic/run_test.sh
docker-compose down -v

docker-compose up -d aerospike
docker-compose run --rm ycsb /data/aerospike/run_test.sh
docker-compose down -v

docker-compose up -d cassandra2
docker-compose exec cassandra2 /setup.sh
docker-compose run --rm ycsb /data/cassandra2/run_test.sh
docker-compose down -v

docker-compose up -d cassandra3
docker-compose exec cassandra3 /setup.sh
docker-compose run --rm ycsb /data/cassandra3/run_test.sh
docker-compose down -v

