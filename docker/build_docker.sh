#!/bin/bash

# HOST=localhost
# PORT=5000

# HOST='docker-registry.distributedlearning.ai'
HOST='harbor.distributedlearning.ai'
PORT=443

IMAGE='vantage/vantage.basic'
TAG='test'

if [ -n "$1" ]
then
    TAG=$1
fi

docker build -t custom-r-base -f Dockerfile.custom-r-base .

if [ $PORT -eq 443 ]
then
    docker build -t $IMAGE:$TAG -t $HOST/$IMAGE:$TAG .
    docker push $HOST/$IMAGE:$TAG
else
    docker build -t $IMAGE:$TAG -t $HOST:$PORT/$IMAGE:$TAG .
    docker push $HOST:$PORT/$IMAGE:$TAG
fi


