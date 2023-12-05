#!/bin/ash -ex

/usr/local/bin/restart-on-change.sh &

exec named -c /etc/bind/named.conf -g -u named
