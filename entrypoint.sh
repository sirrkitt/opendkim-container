#!/bin/sh

set -e

deluser opendkim

addgroup -g $GID -S opendkim 2>/dev/null
adduser -u $UID -SDH -h /run/opendkim -s /sbin/nologin -G opendkim -g opendkim opendkim 2>/dev/null

#check if config read/write
if [ ! -w "/config/" ]
then
	echo "Unable to read or write config directory!"
	return 1
fi
if [ ! -w "/data/" ]
then
        echo "Unable to read or write data directory!"
        return 1
fi
if [ ! -w "/socket/" ]
then
        echo "Unable to read or write socket directory!"
        return 1
fi
/bin/chown -R opendkim:opendkim /config /socket /data /run/opendkim

/usr/sbin/opendkim -u opendkim -f -x /config/opendkim.conf
