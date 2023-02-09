#!/usr/bin/env bash
FILE=/var/run/docker.sock
    if test -f $FILE ; then
    exec sleep infinity
else
    dockerd
fi
