#!/bin/sh

DOCKER_CMD=$(docker inspect -f "{{.Config.Cmd}}" rancher-agent | sed 's/[\[{}]//g' | sed 's/\]//g')
AGENT_IMAGE=$(docker inspect -f "{{.Config.Image}}" rancher-agent)
HOST_IP=$(ifconfig eth0 | grep "inet addr" | cut -d ':' -f 2 | cut -d ' ' -f 1)

docker run -d -e CATTLE_AGENT_IP=$HOST_IP \
    --privileged \
    -v /var/run/docker.sock:/var/run/docker.sock \
    $AGENT_IMAGE \
    $DOCKER_CMD
