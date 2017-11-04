#!/usr/bin/env bash

mkdir -p pkg
cp src/dfu-util src/dfu-prefix src/dfu-suffix pkg/.

cd pkg
zip -r ../output/dfu-util-${TRAVIS_TAG}.zip *

