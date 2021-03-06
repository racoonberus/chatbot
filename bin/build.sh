#!/usr/bin/env bash

IMAGE_NAME=chatbot_app
DOCKER_ID_USER="raccoonberus"

VERSION=$(mvn -Dexec.executable='echo' -Dexec.args='${project.version}' --non-recursive exec:exec -q 2> /dev/null)

echo "Build: ${VERSION}"

mvn clean package
docker build -t $DOCKER_ID_USER/${IMAGE_NAME}:latest \
    -t $DOCKER_ID_USER/${IMAGE_NAME}:${VERSION} .

docker push $DOCKER_ID_USER/${IMAGE_NAME}:${VERSION}
docker push $DOCKER_ID_USER/${IMAGE_NAME}:latest
