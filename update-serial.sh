#!/bin/bash -ex

if [ -z "$*" ]; then
	echo "Usage: $0 <zone file 1> .. [zone file N]"
	exit 1
fi

nextSerial=$( date +%s )
for zoneFile in "$@"; do
	serial=$(grep '; serial' $zoneFile|awk '{ print $1 }')
	tmp=/tmp/$(basename $0).$$
	sed "s/[0-9]* ; serial/$nextSerial ; serial/" $zoneFile > $tmp
	mv $tmp $zoneFile
done

git commit -m "serial updated: $nextSerial" "$@"
git push
