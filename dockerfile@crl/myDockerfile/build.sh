#!/bin/bash
set -x

IMAGE_NAME='-t pytorch:dev'
DOCKER_FILE='-f Dockerfile'

BUILD_DIR=' ./ '

docker build $IMAGE_NAME ${DOCKER_FILE} ${BUILD_DIR}
