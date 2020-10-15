FROM alpine:3.12
LABEL maintainer="Jacob Lemus Peschel <jacob@tlacuache.us>"
ENV V=2.10.3

ENV UID=500
ENV GID=500

COPY entrypoint.sh /entrypoint.sh

RUN     apk update --no-cache && \
        apk add -U --no-cache opendkim opendkim-utils && \
        mkdir -p /run/opendkim && \
        chmod a+x /entrypoint.sh

VOLUME ["/config", "/socket", "/data"]

EXPOSE 8891

ENTRYPOINT ["/entrypoint.sh"]
