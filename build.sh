#!/bin/bash
set -e

TAG='6.10.0-1'
IMAGE_NAME='rpi-node6'
GIT_SHA=$(git rev-parse HEAD)
BUILD_FROM="${USER}/$(hostname)"

docker build --build-arg GIT_SHA=${GIT_SHA} \
             --build-arg BUILD_FROM=${BUILD_FROM} \
             -t $IMAGE_NAME:$TAG .

IMAGE_NAME=${IMAGE_NAME} TAG=${TAG} ./bin/final_info.sh

echo "###"
echo "Tag and push image to repo manualy:"
echo "docker tag ${IMAGE_NAME}:${TAG} ${DOCKER_REG_URL}/${IMAGE_NAME}:${TAG}"
echo "docker tag ${DOCKER_REG_URL}/${IMAGE_NAME}:${TAG} ${DOCKER_REG_URL}/${IMAGE_NAME}:latest"
echo "docker push ${DOCKER_REG_URL}/${IMAGE_NAME}"
