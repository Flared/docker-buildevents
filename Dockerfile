FROM golang:alpine3.19

RUN apk add --no-cache \
        git

RUN git clone \
      --depth 1 \
      --branch "v0.16.0"  \
      https://github.com/honeycombio/buildevents /opt/buildevents \
    && cd /opt/buildevents \
    && go install github.com/honeycombio/buildevents/

RUN apk del \
        git

ENTRYPOINT ["buildevents"]
