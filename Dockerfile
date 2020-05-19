FROM dellelce/varnish-base

RUN apk add --no-cache libexecinfo && \
    rm -rf ${INSTALLDIR}/include

ENV PATH ${PATH}:${INSTALLDIR}/sbin

CMD ["/bin/sh"]

