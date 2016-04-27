#!/usr/bin/env bash

set -e

while ! nc -z cassandra2 9042; do
  sleep 0.2 # wait for 1/5 of the second before check again
done

cqlsh cassandra2 -e "create keyspace ycsb WITH REPLICATION = {'class' : 'SimpleStrategy', 'replication_factor': 3 }; use ycsb; create table usertable (y_id varchar primary key, field0 varchar, field1 varchar, field2 varchar, field3 varchar, field4 varchar, field5 varchar, field6 varchar, field7 varchar, field8 varchar, field9 varchar);"
