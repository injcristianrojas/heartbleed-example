#!/usr/bin/env bash

if [ -z "$1" ]
  then
    echo "No server specified. Using 127.0.0.1..."
    SERVER_ADDRESS="127.0.0.1"
  else
    SERVER_ADDRESS="$1"
fi

if [ -z "$2" ]
  then
    TIME_BETWEEN_REQS="1"
  else
    TIME_BETWEEN_REQS="$2"
fi

while :
do
  USER=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
  PASSWORD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1)
  curl -v --insecure -d "user=$USER&password=$PASSWORD" \
    -A "User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0;)" \
    https://$SERVER_ADDRESS
  sleep $TIME_BETWEEN_REQS
done
