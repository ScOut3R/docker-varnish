#!/bin/bash

varnishd -s malloc,${MEMORY:-128}M \
         -a 0.0.0.0:80 \
         -b ${BACKEND} \
         -t ${TTL:-120}
sleep 1
varnishncsa -F '%{X-Forwarded-For}i %l %u %t "%r" %s %b "%{Referer}i" "%{User-agent}i" "%{Varnish:hitmiss}x"'
