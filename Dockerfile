FROM alpine:latest as knife

RUN apk add bash bind-tools curl tcpdump mysql-client iproute2 aws-cli

WORKDIR /root

# Copy binaries
COPY --from=fullstorydev/grpcurl:latest-alpine /bin/grpcurl /usr/bin/
COPY --from=mccutchen/go-httpbin /bin/go-httpbin /usr/bin/
# Ensure binaries
RUN which grpcurl go-httpbin

CMD "go-httpbin"
