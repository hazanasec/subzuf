#!/bin/bash

if [ $# -eq 0 ]; then
	echo "usage: $0 domain"
	exit
fi

(hash subfinder) 2>/dev/null
if [ ! $? -eq 0 ]; then
	echo "subfinder is required"
	exit
fi

subfinder -all -recursive -silent -d $1