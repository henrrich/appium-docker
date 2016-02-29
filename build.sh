#!/bin/bash
appium_version=$1
tag=$2

docker build --build-arg APPIUM_VERSION=$appium_version -t testobject-appium .

docker tag -f testobject-appium head.testobject.org:5000/testobject-appium:$tag
docker push head.testobject.org:5000/testobject-appium:$tag
