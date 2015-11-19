#!/bin/bash

varnishd -f /etc/varnish/default.vcl \
         -s malloc,${MEMORY:-128}M \
         -a 0.0.0.0:80 \
         -b ${BACKEND} \
         -t ${TTL:-120}
sleep 1
varnishncsa
