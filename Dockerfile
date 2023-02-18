FROM ubuntu:latest

RUN apt-get update \
	&& apt-get install -y bash curl file git unzip xz-utils zip libglu1-mesa

RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

RUN flutter doctor -v \
	&& flutter channel stable \
	&& flutter upgrade \
	&& flutter config --enable-web

RUN mkdir -p /work
WORKDIR /work
