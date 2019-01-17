# Setting packages version
ARG OPENJDK_VERSION="8"

FROM library/openjdk:$OPENJDK_VERSION-alpine

LABEL maintainer="Gerardo Junior <me@gerardo-junior.com>"
LABEL url="https://github.com/gerardo-junior/dynamodb-docker.git"

ENV DYNAMODB_PORT 80
ENV DYNAMODB_PATH /opt/dynamodb
ENV JAVA_OPTS ""

WORKDIR /tmp

ARG DYNAMODB_VERSION="2018-04-11"
ARG DYNAMODB_SOURCE_URL="https://s3-us-west-2.amazonaws.com/dynamodb-local"
RUN set -xe && \
    wget ${DYNAMODB_SOURCE_URL}/dynamodb_local_${DYNAMODB_VERSION}.tar.gz && \
    wget ${DYNAMODB_SOURCE_URL}/dynamodb_local_${DYNAMODB_VERSION}.tar.gz.sha256 && \
    sha256sum -c dynamodb_local_${DYNAMODB_VERSION}.tar.gz.sha256

RUN set -xe && \
    mkdir -p ${DYNAMODB_PATH} && \
    tar zxvf dynamodb_local_${DYNAMODB_VERSION}.tar.gz -C ${DYNAMODB_PATH} && \
    rm dynamodb_local_${DYNAMODB_VERSION}.tar.gz dynamodb_local_${DYNAMODB_VERSION}.tar.gz.sha256

COPY ./tools /opt/tools
RUN chmod -R +x /opt/tools/

WORKDIR $DYNAMODB_PATH
VOLUME [$DYNAMODB_PATH, "/run/dynamodb"]
EXPOSE $DYNAMODB_PORT
ENTRYPOINT ["/bin/sh", "/opt/tools/entrypoint.sh"]

CMD ["--sharedDb", "-dbPath", "/run/dynamodb"]
