#!/bin/bash
appium_version=$1

docker build --build-arg APPIUM_VERSION=$appium_version -t devicebox-appium-android .

docker tag -f devicebox-appium-android henrrich/devicebox-appium-android:$appium_version
docker push henrrich/devicebox-appium-android:$appium_version
