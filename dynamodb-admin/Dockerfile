FROM node:6-alpine

ENV DYNAMO_ENDPOINT=

RUN npm install dynamodb-admin -g

ENTRYPOINT dynamodb-admin
EXPOSE 8001
