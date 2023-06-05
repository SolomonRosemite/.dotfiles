#!/bin/bash

DOCKERFILE=$(pwd)/Dockerfile
cd .. && docker build -t test-env -f $DOCKERFILE . && cd -
