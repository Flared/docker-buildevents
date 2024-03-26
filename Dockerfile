# Stage 1: Build the application
FROM golang:alpine3.19 AS builder

RUN apk add --no-cache git \
    && git clone --depth 1 --branch "v0.16.0" https://github.com/honeycombio/buildevents /opt/buildevents \
    && cd /opt/buildevents \
    && go install github.com/honeycombio/buildevents/ \
    && apk del git

# Stage 2: Create the final Docker image
FROM alpine:3.19

COPY --from=builder /go/bin/buildevents /usr/local/bin/buildevents

ENTRYPOINT ["buildevents"]
