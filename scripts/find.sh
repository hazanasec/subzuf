#!/bin/bash

if [ $# -eq 0 ]; then
	echo "usage: $0 domain output"
	exit
fi

BASEDIR=$(dirname "$0")

 (bash $BASEDIR/_subfind.sh $1 | subzuf $1 | $BASEDIR/./json2raw.sh ; cat $BASEDIR/subs.txt | subzuf hostevents.io | $BASEDIR/./json2raw.sh) | sort -u | tee $2