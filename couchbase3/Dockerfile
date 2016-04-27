FROM couchbase:3.1.0

RUN apt-get update && apt-get -y install --no-install-recommends netcat && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD setup.sh /setup.sh
