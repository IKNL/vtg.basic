#!/bin/bash

HOST='harbor.distributedlearning.ai'
IMAGE='vantage/vantage.basic'
TAG='test'

if [ -n "$1" ]
then
    TAG=$1
fi

# The custom R base adds a few linux packages:
#   libssl-dev libcurl4-openssl-dev libxml2-dev
docker build -f docker/Dockerfile.custom-r-base -t custom-r-base .

# Build the docker image containing the local algorithm
# docker build --no-cache -f docker/Dockerfile -t $IMAGE:$TAG -t $HOST/$IMAGE:$TAG .
docker build -f docker/Dockerfile -t $IMAGE:$TAG -t $HOST/$IMAGE:$TAG .
docker push $HOST/$IMAGE:$TAG


# This only works on macOS
if [ -x "$(command -v osascript)" ]
then
    NOTIFICATION_TXT="docker build of '$IMAGE' finished"
    NOTIFICATION_TITLE='Docker'
    osascript << EOF
    display notification "$NOTIFICATION_TXT"¬
    with title "$NOTIFICATION_TITLE"¬
    sound name "Submarine"
EOF

fi
