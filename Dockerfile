FROM alpine:latest as build

RUN apk upgrade --no-cache && apk add --no-cache varnish bash

CMD ["/bin/sh"]

