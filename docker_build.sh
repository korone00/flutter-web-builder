#!/bin/sh
docker login -u korone
if [ $? = 1 ]; then
        echo "Failed to login"
        exit
fi

docker buildx build \
--no-cache \
--push \
--tag korone/flutter-web-builder:latest .

#docker buildx build \
#--no-cache \
#--push \
#--platform linux/arm64/v8,linux/amd64 \
#--tag korone/flutter-web-builder:latest .
