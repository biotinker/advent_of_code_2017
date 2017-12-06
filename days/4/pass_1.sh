#!/bin/bash
inFile=$1
count=0
while read line; do
	if ! echo $line | tr ' ' '\n' | sort | uniq -c | grep -v 1 ; then
		((count++))
	fi
done <$inFile
echo $count
