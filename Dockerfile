FROM ubuntu:14.04
MAINTAINER Iain Mckay <me@iainmckay.co.uk>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && pip install awscli

ADD start.sh /start.sh

ENTRYPOINT ["/start.sh"]
