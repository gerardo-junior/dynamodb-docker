# Use JDK 7. I tried alpine, but all calls to dynamo then fail silently...
# FROM openjdk:7-jre-alpine
FROM openjdk:8-jre
LABEL Maintainer="Gerardo Junior <me@gerardo-junior.com>"

ENV DYNAMODB_VERSION=latest
ENV DYNAMODB_PORT=8000
ENV DYNAMODB_PATH=/opt/dynamodb
ENV JAVA_OPTS=

RUN set -xe && \
    mkdir -p ${DYNAMODB_PATH} && \
    wget https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_${DYNAMODB_VERSION}.tar.gz && \
    wget https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_${DYNAMODB_VERSION}.tar.gz.sha256 && \
    sha256sum -c dynamodb_local_${DYNAMODB_VERSION}.tar.gz.sha256 && \
    tar zxvf dynamodb_local_${DYNAMODB_VERSION}.tar.gz -C ${DYNAMODB_PATH} && \
    rm dynamodb_local_${DYNAMODB_VERSION}.tar.gz dynamodb_local_${DYNAMODB_VERSION}.tar.gz.sha256

COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR $DYNAMODB_PATH
VOLUME ["/run/dynamodb"]
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
EXPOSE 8000

CMD ["--sharedDb", "-dbPath", "/run/dynamodb"]
