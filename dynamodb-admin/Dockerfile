FROM node:6-alpine

ARG DYNAMODBDUMP_VERSION=1.1.4
ENV DYNAMO_ENDPOINT=

RUN apk --update add --virtual .persistent-deps \
                               python \
                               py-pip

RUN apk add ca-certificates wget && update-ca-certificates

RUN set -xe && \
    wget -qO- https://github.com/bchew/dynamodump/archive/v${DYNAMODBDUMP_VERSION}.tar.gz | tar -xvz -C /opt/ && \
    mv /opt/dynamodump-${DYNAMODBDUMP_VERSION} /opt/dynamodbdump && cd /opt/dynamodbdump && \
    pip install -r requirements.txt && \
    chmod +x /opt/dynamodbdump/dynamodump.py && \
    ln -s /opt/dynamodbdump/dynamodump.py /usr/bin/dynamodump && \
    ln -s /opt/dynamodbdump/dump /run/dump

RUN npm install dynamodb-admin -g

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
EXPOSE 8001
