#!/usr/bin/env sh
set -ex

exec java -Djava.library.path=. ${JAVA_OPTS} -jar DynamoDBLocal.jar -port ${DYNAMODB_PORT} "$@"
