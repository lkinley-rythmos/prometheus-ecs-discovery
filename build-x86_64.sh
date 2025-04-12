#!/bin/bash

golang_ver=1.24

[ ! -d cache ] && mkdir cache

# pull latest image
docker pull amd64/golang:$golang_ver-alpine
# build x86_64
docker run --rm -it -v $(pwd)/cache:/go -v $(pwd):/src -w /src --platform linux/amd64 amd64/golang:$golang_ver-alpine go build
[ $? -eq 0 ] && mv prometheus-ecs-discovery prometheus-ecs-discovery.x86_64
