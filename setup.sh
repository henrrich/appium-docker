#!/bin/sh
cd /root && set -a && . /root/version.env
npm install appium@$APPIUM_VERSION
mkdir -p /root/appium/appium/
mv /root/node_modules/appium /root/appium/appium/$APPIUM_VERSION
mkdir /root/appium/appium/$APPIUM_VERSION/build/SafariLauncher
cp --no-clobber /root/SafariLauncher.zip /root/appium/appium/$APPIUM_VERSION/build/SafariLauncher/SafariLauncher.zip
rm /root/SafariLauncher.zip
if "$APPIUM_VERSION" == "1.4.16" ; then
  echo "replacing chromium driver"
  cd /root/appium/appium/$APPIUM_VERSION
  npm install appium-chromedriver@2.5.1
  patch -p0 < /root/patches/chrome.patch;
fi
