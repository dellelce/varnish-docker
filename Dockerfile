FROM dellelce/varnish-base

RUN apk add --no-cache libexecinfo

ENV PATH ${PATH}:${INSTALLDIR}/sbin

CMD ["/bin/sh"]

