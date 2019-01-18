#!/bin/sh

if [[ -z "$1" ]]; then 
    exec dynamodb-admin 
else
    exec "$@"
fi
