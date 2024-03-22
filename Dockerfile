FROM alpine:3

RUN apk add --no-cache \
        curl

RUN mkdir -p /opt/buildevents

WORKDIR /opt/buildevents

# Install buildevents
RUN curl -L \
    -o buildevents \
    https://github.com/honeycombio/buildevents/releases/download/v0.16.0/buildevents-linux-amd64 \
    && chmod 755 buildevents

CMD ["/opt/buildevents/buildevents", "--help"]

