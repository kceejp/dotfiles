#!/bin/sh

/sbin/ifconfig eth0|grep 'inet addr'|awk -F: '{print $2}'|awk '{ print $1 }'
