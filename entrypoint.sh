#!/bin/sh

set -e

#check if config read/write
	#or else die
if [ ! -w "/config/" ]
then
	echo "Unable to read or write config directory!"
	return 1

/bin/chown -R opendkim:opendkim /config

/usr/sbin/opendkim -u opendkim -f -x /config/opendkim.conf
