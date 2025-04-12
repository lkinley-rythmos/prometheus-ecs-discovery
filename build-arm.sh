#!/bin/bash

golang_ver=1.24

[ ! -d cache ] && mkdir cache

# pull latest image
docker pull arm64v8/golang:$golang_ver-alpine
# build arm
docker run --rm -it -v $(pwd)/cache:/go -v $(pwd):/src -w /src arm64v8/golang:$golang_ver-alpine go build
[ $? -eq 0 ] && mv prometheus-ecs-discovery prometheus-ecs-discovery.aarch64
