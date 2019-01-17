# Docker image of dynamodb and dynamodb-admin

```
    [+] AUTOR:        Gerardo Junior
    [+] SITE:         https://gerardo-junior.com
    [+] EMAIL:        me@gerardo-junior.com
    [+] GITHUB:       https://github.com/gerardo-junior/dynamodb-docker.git
    [+] TELEGRAM:     @MrGerardoJunior
```

## dynamodb [![Docker Automated build](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/gerardojunior/dynamodb/)
- [stable](https://github.com/gerardo-junior/dynamodb-docker/blob/master/dynamodb/Dockerfile), [latest](https://github.com/gerardo-junior/dynamodb-docker/blob/develop/dynamodb/Dockerfile), [1.0.0](https://github.com/gerardo-junior/dynamodb-docker/blob/1.0.0/dynamodb/Dockerfile)
  - [openjdk](https://openjdk.java.net/) 8
  - [dynamodb local version](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.DownloadingAndRunning.html) 2018-04-11

## dynamodb-admin [![Docker Automated build](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/gerardojunior/dynamodb-admin/)
- [stable](https://github.com/gerardo-junior/dynamodb-docker/blob/master/dynamodb-admin/Dockerfile), [latest](https://github.com/gerardo-junior/dynamodb-docker/blob/develop/dynamodb-admin/Dockerfile), [1.0.0](https://github.com/gerardo-junior/dynamodb-docker/blob/1.0.0/dynamodb-admin/Dockerfile)
  - [openjdk](https://openjdk.java.net/) 6.16.0
  - [dynamodb-admin](https://github.com/aaronshaf/dynamodb-admin) 3.1.0
  - [dynamodbdump](https://github.com/bchew/dynamodump.git) 1.1.4

## Come on, do your tests

```bash
docker pull gerardojunior/dynamodb:stable
docker pull gerardojunior/dynamodb-admin:stable
```

## How to build

to build the image you need install the [docker engine](https://www.docker.com/) only

*~ You can try building with different versions of software with docker args, for example: DYNAMODB_VERSION=latest ~*
```bash
# dynamodb
docker build https://github.com/gerardo-junior/dynamodb-docker.git#:dynamodb --tag gerardojunior/dynamodb-admin

# dynamodb-admin
docker build https://github.com/gerardo-junior/dynamodb-docker.git#:dynamodb-admin --tag gerardojunior/dynamodb-admin
```
## How to use

##### Only with docker command:

```bash
# in your project folder
docker run -d -p 4321:8080 gerardojunior/dynamodb:stable
```
##### With [docker-compose](https://docs.docker.com/compose/)

Create the docker-compose.yml file  in your project folder with:

```yml
# (...)

dynamodb:
    image: gerardojunior/dynamodb:stable
    volumes:
    - type: volume
        source: dbdata
        target: /run/dynamodb
        volume:
            nocopy: true

dynamodb-admin:
    image: gerardojunior/dynamodb-admin:stable
    environment:
        - DYNAMO_ENDPOINT=http://dynamodb
    ports:
        - '8001:8001' # Web admin
    links:
        - dynamodb
    depends_on:
        - dynamodb

# (...)
volumes:
  dbdata:
    name: dynamodb-dbdata
        
```

## How to enter dynamodb-admin image shell
 
```bash
docker run -it --rm gerardojunior/dynamodb-admin:stable sh

# or with docker-compose

docker-compose run dynamodb-admin sh
```

### License  
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
