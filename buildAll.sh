#!/bin/bash
while IFS='' read -r line || [[ -n "$line" ]]; do
    ./build.sh $line
done < appium.versions
