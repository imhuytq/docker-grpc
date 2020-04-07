FROM golang:1.14-alpine3.11 as builder

RUN apk --update --no-cache add \
    curl \
    git \
    build-base \
    autoconf \
    automake \
    libtool

WORKDIR /tmp

RUN curl -OL https://github.com/protocolbuffers/protobuf/releases/download/v3.11.4/protobuf-cpp-3.11.4.tar.gz && \
    tar xvzf protobuf-cpp-3.11.4.tar.gz

WORKDIR /tmp/protobuf-3.11.4

RUN mkdir /export

RUN ./autogen.sh && \
    ./configure --prefix=/export && \
    make && \
    make check && \
    make install

RUN curl -OL https://github.com/grpc/grpc-web/releases/download/1.0.7/protoc-gen-grpc-web-1.0.7-linux-x86_64 \
    && mv protoc-gen-grpc-web-1.0.7-linux-x86_64 /export/bin/protoc-gen-grpc-web

FROM alpine:3.11

RUN apk --no-cache add ca-certificates

COPY --from=builder /export /usr

RUN ls -la /usr && ls -la /usr/local
