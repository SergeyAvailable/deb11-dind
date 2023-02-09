#!/usr/bin/env bash
/var/run/docker.sock 2> /dev/null
if [ $? == 126 ] 
    then
      exec sleep infinity
    else
      dockerd
fi
