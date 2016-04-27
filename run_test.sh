#!/usr/bin/env bash

docker-compose run --rm ycsb /data/basic/run_test.sh

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

docker-compose up -d couchbase2
docker-compose exec couchbase2 /setup.sh
docker-compose run --rm ycsb /data/couchbase2/run_test.sh
docker-compose down -v

docker-compose up -d couchbase3
docker-compose exec couchbase3 /setup.sh
docker-compose run --rm ycsb /data/couchbase3/run_test.sh
docker-compose down -v

#docker-compose up -d couchbase4
#docker-compose exec couchbase4 /setup.sh
#docker-compose run --rm ycsb /data/couchbase4/run_test.sh
#docker-compose down -v
