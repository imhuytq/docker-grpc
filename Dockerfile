FROM alpine:3

RUN apk --update --no-cache add \
    curl \
    git \
    protobuf-dev

RUN curl -L -o protoc-gen-grpc-web https://github.com/grpc/grpc-web/releases/download/1.0.7/protoc-gen-grpc-web-1.0.7-linux-x86_64

RUN mv protoc-gen-grpc-web /usr/local/bin/protoc-gen-grpc-web
