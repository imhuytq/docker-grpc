FROM alpine:3

RUN apk --update --no-cache add \
    protobuf
