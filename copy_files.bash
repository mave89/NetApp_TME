#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

if [ $# -ne 2 ]; then
	echo "No arguments provided. Give the filename and path on the remote server to copy."
	exit 1
fi

FILENAME=$1
REMOTEPATH=$2

for ((i=136; i<=146; i=i+2)); do
    if scp -r -o ConnectTimeout=5 $FILENAME faiz89@10.63.150.$i:$REMOTEPATH; then
		echo "10.63.150.$i done."
	else
		echo "10.63.150.$i is not reachable."
	fi
done
    