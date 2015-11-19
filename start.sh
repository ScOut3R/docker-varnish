#!/bin/bash

varnishd -f /etc/varnish/default.vcl -s malloc,${MEMORY}M -a 0.0.0.0:80
sleep 1
varnishncsa
