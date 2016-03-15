#!/bin/bash
appium_version=$1

echo "APPIUM_VERSION=$appium_version" > version.env

docker build -t testobject-appium .

docker tag -f testobject-appium testobject/appium:$appium_version
docker push testobject/appium:$appium_version
