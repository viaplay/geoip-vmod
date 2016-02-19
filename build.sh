#!/usr/bin/env bash
image=$(basename $PWD):build
docker build -t $image .
