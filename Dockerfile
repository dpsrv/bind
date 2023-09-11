FROM alpine:3.18

RUN apk --update add bind bind-dnssec-tools \
	&& rm -rf /var/cache/apk/*

EXPOSE 53/udp
EXPOSE 53/tcp

CMD ["named", "-c", "/etc/bind/named.conf", "-g", "-u", "named"]

