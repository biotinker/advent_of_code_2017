#!/bin/bash
inFile=$1
count=0
while read line; do
	arr=( $line )
	linesort=""
	for word in ${arr[@]}; do
		linesort="${linesort} $(echo $word | fold -w 1 | sort | tr -d '\n')"
	done
	if ! echo $linesort | tr ' ' '\n' | sort | uniq -c | grep -v 1 ; then
		((count++))
	fi
done <$inFile
echo $count
