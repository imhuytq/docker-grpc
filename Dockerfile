ARG protobuf=3.11.4
ARG grpc-web=1.0.7

FROM alpine:3

RUN apk --update --no-cache add \
    curl \
    git

RUN curl -OL https://github.com/protocolbuffers/protobuf/releases/download/v${protobuf}/protoc-${protobuf}-linux-x86_64.zip \
    && unzip -o protoc-${protobuf}-linux-x86_64.zip -d /usr/local bin/protoc

RUN curl -OL https://github.com/grpc/grpc-web/releases/download/${grpc-web}/protoc-gen-grpc-web-${grpc-web}-linux-x86_64 \
    && mv protoc-gen-grpc-web-${grpc-web}-linux-x86_64 /usr/local/bin/protoc-gen-grpc-web
