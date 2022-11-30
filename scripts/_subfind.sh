#!/bin/bash

if [ $# -eq 0 ]; then
	echo "usage: $0 domain"
	exit
fi

BASEDIR=$(dirname "$0")
TOOLS=("subfinder.sh")

for tool in "${TOOLS[@]}"; do
	if [ -x "$BASEDIR/$tool" ]; then
		"$BASEDIR"/"$tool" "$1" &
	fi
done

wait $(jobs -p)
