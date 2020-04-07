FROM alpine:3

RUN apk --update --no-cache add \
    curl \
    git

RUN curl -OL https://github.com/protocolbuffers/protobuf/releases/download/v3.11.4/protoc-3.11.4-linux-x86_64.zip \
    && unzip -o protoc-3.11.4-linux-x86_64.zip -d /usr/local bin/protoc \
    && unzip -o protoc-3.11.4-linux-x86_64.zip -d /usr/local 'include/*'

RUN curl -OL https://github.com/grpc/grpc-web/releases/download/1.0.7/protoc-gen-grpc-web-1.0.7-linux-x86_64 \
    && mv protoc-gen-grpc-web-1.0.7-linux-x86_64 /usr/local/bin/protoc-gen-grpc-web
