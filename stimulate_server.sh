#!/usr/bin/env bash

while :
do
	RAND_STRING=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)	
	curl -v --insecure https://172.17.0.3?data=$RAND_STRING
	sleep 1
done

