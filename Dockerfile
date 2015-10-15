FROM ubuntu:14.04
MAINTAINER Iain Mckay <me@iainmckay.co.uk>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -yq --no-install-recommends python-pip \
    && pip install awscli

volume /filebackup
ADD start.sh /start.sh

ENTRYPOINT ["/start.sh"]
