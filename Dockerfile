FROM dellelce/varnish-base

RUN apk add --no-cache libexecinfo gcc binutils musl-dev && \
    mkdir /var/varnish && \
    rm -rf ${INSTALLDIR}/include

ENV PATH ${PATH}:${INSTALLDIR}/sbin

CMD ["/bin/sh"]

