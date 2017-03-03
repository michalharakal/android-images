#!/bin/bash

# Older versions of docker-compose are not capable to build them all ...

set -eu

docker build -t android/java-8-jdk 8-jdk
docker build -t android/gradle gradle
docker build -t android/sdk sdk
docker build -t android/node node
docker build -t android/cordova cordova