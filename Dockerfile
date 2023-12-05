FROM alpine:3.18

RUN apk --update add bind bind-dnssec-tools \
	&& rm -rf /var/cache/apk/*

COPY restart-on-change.sh /usr/local/bin/
COPY docker-entrypoint.sh /usr/local/bin/

EXPOSE 53/udp
EXPOSE 53/tcp

CMD ["/usr/local/bin/docker-entrypoint.sh"]

