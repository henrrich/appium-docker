#!/bin/bash

echo "preparing appium version $APPIUM_VERSION"

if [[ $APPIUM_VERSION == 1.5.* ]]; then
  echo "Installing java dependency"
  apt-get update
  apt-get -y install default-jdk
fi

npm install appium@$APPIUM_VERSION
mkdir -p /root/appium/appium/
mv /root/node_modules/appium /root/appium/appium/$APPIUM_VERSION
mkdir /root/appium/appium/$APPIUM_VERSION/build/SafariLauncher
cp --no-clobber /root/SafariLauncher.zip /root/appium/appium/$APPIUM_VERSION/build/SafariLauncher/SafariLauncher.zip
rm /root/SafariLauncher.zip

if [ "$APPIUM_VERSION" == '1.4.16' ]; then
  echo "replacing chromium driver"
  cd /root/appium/appium/$APPIUM_VERSION
  npm install appium-chromedriver@2.5.1

  # fix max buffer exceeded by increasing the buffer to 1MB
  sed -i -- 's/524288/1048576/g' node_modules/appium-adb/lib/adb.js
  sed -i -- 's/524288/1048576/g' node_modules/appium-adb/lib/helpers.js

  patch -p0 < /root/patches/0001-handover-custom-adb-port-to-chromedriver.patch;
fi
