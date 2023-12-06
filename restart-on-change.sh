#!/bin/ash

cd /etc/bind/zones

last=$( ls -1t | head -1 | xargs date +%s -r )
while true; do
	latest=$( ls -1t | head -1 | xargs date +%s -r )
	if [ $latest -gt $last ]; then
		last=$latest
		kill -HUP 1
	fi
	sleep 60
done
