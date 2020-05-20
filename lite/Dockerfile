FROM dellelce/varnish-base as source

RUN  cp -p ${INSTALLDIR}/sbin/varnishd /sbin/varnishd && \
     cp -p ${INSTALLDIR}/lib/*pcre* /lib/

FROM alpine:3.8

COPY --from=source /sbin/varnishd /sbin/varnishd
COPY --from=source /lib/*pcre* /lib/

RUN apk add --no-cache libexecinfo gcc binutils musl-dev && \
    mkdir /var/varnish

CMD ["/bin/sh"]

