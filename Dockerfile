FROM golang:1.18.2-alpine3.15 as golang-builder

RUN apk update \
    && apk add --virtual build-dependencies git \
    && apk add bash curl jq
RUN go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest


FROM alpine:3.15 as knife

RUN apk add bind-tools curl tcpdump mysql-client iproute2 aws-cli

WORKDIR /root

ENV PATH="${PATH}:/root/usr/bin"
RUN mkdir -p usr/bin

COPY --from=golang-builder /go/bin/grpcurl usr/bin/

