#!/bin/sh

if [ ! -z "$1" ]; then
    exec java -Djava.library.path=. ${JAVA_OPTS} -jar DynamoDBLocal.jar -port ${DYNAMODB_PORT} "$@"
else 
    exec "$@"
fi