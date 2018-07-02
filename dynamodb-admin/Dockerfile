FROM node:6-alpine

ENV DYNAMO_ENDPOINT=

RUN apk --update add --virtual .persistent-deps \
                               python \
                               py-pip

RUN apk add ca-certificates wget && update-ca-certificates

RUN set -xe && \
    wget -qO- https://github.com/bchew/dynamodump/archive/v1.1.4.tar.gz | tar -xvz -C /opt/ && \
    mv /opt/dynamodump-1.1.4 /opt/dynamodbdump && cd /opt/dynamodbdump && \
    pip install -r requirements.txt && \
    chmod +x /opt/dynamodbdump/dynamodump.py && \
    ln -s /opt/dynamodbdump/dynamodump.py /usr/local/bin/dynamodump && \
    ln -s /opt/dynamodbdump/dump /var/dump


RUN npm install dynamodb-admin -g

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
EXPOSE 8001
