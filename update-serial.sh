#!/bin/bash -e

if [ -z "$*" ]; then
	echo "Usage: $0 <zone file 1> .. [zone file N]"
	exit 1
fi

nextSerial=$( date +%s )
for zoneFile in "$@"; do
	serial=$(grep '; serial' $zoneFile|awk '{ print $1 }')
	sed -i.$serial "s/[0-9]* ; serial/$nextSerial ; serial/" $zoneFile
done
