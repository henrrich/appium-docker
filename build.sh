#!/bin/bash
appium_version=$1
tag=$2

docker build -t testobject-appium --build-arg APPIUM_VERSION=$appium_version .

docker tag -f testobject-appium head.testobject.org:5000/testobject-appium:$tag
docker push head.testobject.org:5000/testobject-appium:$tag
