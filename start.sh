#!/bin/bash

varnishd -f /etc/varnish/default.vcl -s malloc,${MEMORY}M -a 0.0.0.0:8080
sleep 1
varnishncsa
