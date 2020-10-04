FROM alpine:3.12
LABEL maintainer="Jacob Lemus Peschel <jacob@tlacuache.us>"
ENV V=2.10.3

COPY entrypoint.sh /entrypoint.sh

RUN     apk update --no-cache && \
        apk add -U --no-cache opendkim opendkim-utils && \
        mkdir -p /config /socket/opendkim /run/opendkim && \
        chown -R root:root /socket && \
	chown -R opendkim:opendkim /config /run/opendkim && \
        chmod a+x /entrypoint.sh

EXPOSE 389
EXPOSE 636

VOLUME ["/config", "/socket"]

ENTRYPOINT ["/entrypoint.sh"]
