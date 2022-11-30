#!/bin/bash

(hash jq) 2>/dev/null
if [ ! $? -eq 0 ]; then
	echo "jq is required"
	exit
fi

jq -r '["domain"], (.[] | [.domain]) | @csv' | sed 's/"//g' | tail -n +2 < "${1:-/dev/stdin}"
