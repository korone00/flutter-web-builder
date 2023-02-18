#!/bin/sh
docker login -u korone
if [ $? = 1 ]; then
        echo "Failed to login"
        exit
fi

OS_ARCH=`arch`
if [ $OS_ARCH = "arm64" ]; then
	VERSION="latest-$OS_ARCH"
else
	VERSION="latest"
fi

docker buildx build \
--no-cache \
--push \
--tag korone/flutter-web-builder:$VERSION .

#docker buildx build \
#--no-cache \
#--push \
#--platform linux/arm64/v8,linux/amd64 \
#--tag korone/flutter-web-builder:latest .
