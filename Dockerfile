FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y apt-transport-https curl
RUN curl https://repo.varnish-cache.org/GPG-key.txt | apt-key add -
RUN echo "deb https://repo.varnish-cache.org/ubuntu/ trusty varnish-4.0" >> /etc/apt/sources.list.d/varnish-cache.list
RUN apt-get update && apt-get upgrade -y && apt-get install -y varnish
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 80

COPY start.sh /
CMD ["/start.sh"]
