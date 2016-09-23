FROM openjdk:8-jdk-alpine

RUN apk --no-cache add python wget openssl ca-certificates && update-ca-certificates

ARG YCSB_VER
ENV YCSB_VER ${YCSB_VER:-0.11.0}
ARG YCSB_BINDING
ENV YCSB_BINDING ${YCSB_BINDING:-ycsb}

ENV URL https://github.com/brianfrankcooper/YCSB/releases/download/${YCSB_VER}/${YCSB_BINDING}-${YCSB_VER}.tar.gz

RUN echo $YCSB_BINDING $YCSB_VER $URL && wget -qO- $URL | tar zxv -C / && ln -nsf /ycsb* /ycsb

WORKDIR /ycsb
