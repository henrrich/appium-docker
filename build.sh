#!/bin/bash
appium_version=$1

echo "APPIUM_VERSION=$appium_version" > version.env

docker build -t testobject-appium .

docker tag -f testobject-appium head.testobject.org:5000/testobject-appium:$appium_version
docker push head.testobject.org:5000/testobject-appium:$appium_version
