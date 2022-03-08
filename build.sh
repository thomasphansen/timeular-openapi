#!/usr/bin/env bash

set -e

rm -rf docs lib test

docker pull spysystem/openapi-generator:th-spy-master
docker run \
	--user $(id -u):$(id -g) \
	--rm -v ${PWD}:/local spysystem/openapi-generator:th-spy-master generate \
	-i /local/timeular.yaml \
	-g php \
	-o /local \
	-c /local/config.json

#git add docs/*
#git add lib/*
#git add test/*
