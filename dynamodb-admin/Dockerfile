ARG NODEJS_VERSION="6.16.0"

FROM node:$NODEJS_VERSION-alpine

ENV DYNAMO_ENDPOINT=

WORKDIR /tmp

RUN apk --update add --virtual .persistent-deps \
                               python \
                               py-pip

ARG DYNAMODBADMIN_VERSION="3.1.0"
RUN npm install dynamodb-admin@${DYNAMODBADMIN_VERSION} -g

ARG DYNAMODBDUMP_VERSION="1.1.4"
ARG DYNAMODBDUMP_SHA256="247c1f4b4998bae5228c8d57a69f525d22476cdddd32e16b7733a78fead6487d"
ARG DYNAMODBDUMP_SOURCE_URL="https://github.com/bchew/dynamodump/archive"
RUN set -xe && \
    wget ${DYNAMODBDUMP_SOURCE_URL}/v${DYNAMODBDUMP_VERSION}.tar.gz && \
    echo "${DYNAMODBDUMP_SHA256}  v${DYNAMODBDUMP_VERSION}.tar.gz" | sha256sum -c

RUN set -xe && \
    tar zxvf v${DYNAMODBDUMP_VERSION}.tar.gz && \
    mkdir -p /opt/dynamodbdump && \
    mv -f dynamodump-${DYNAMODBDUMP_VERSION}/* /opt/dynamodbdump && \
    cd /opt/dynamodbdump && \
    pip install -r requirements.txt && \
    chmod +x /opt/dynamodbdump/dynamodump.py && \
    ln -s /opt/dynamodbdump/dynamodump.py /usr/bin/dynamodump && \
    ln -s /opt/dynamodbdump/dump /var/dump && \
    rm -Rf /tmp/v${DYNAMODBDUMP_VERSION}.tar.gz /tmp/dynamodump-${DYNAMODBDUMP_VERSION}

COPY ./tools /opt/tools
RUN chmod -R +x /opt/tools/

WORKDIR /var/dump
VOLUME ['/var/dump']
EXPOSE 8001
ENTRYPOINT ["/bin/sh", "/opt/tools/entrypoint.sh"]
