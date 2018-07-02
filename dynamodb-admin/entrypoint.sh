#!/bin/sh

if [[ -z "$1" ]]; then 
    dynamodb-admin 
else
    exec "$@"
fi
