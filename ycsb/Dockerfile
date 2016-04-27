FROM java:8-jdk-alpine

RUN apk --no-cache add python

RUN wget -qO- https://github.com/brianfrankcooper/YCSB/releases/download/0.8.0/ycsb-0.8.0.tar.gz | tar zxv -C / && ln -nsf /ycsb* /ycsb

WORKDIR /ycsb
