#!/usr/bin/env bash

set -e
set -x

# Copy Files, including libusb
mkdir -p pkg
cp src/dfu-util src/dfu-prefix src/dfu-suffix pkg/.
cp /usr/local/opt/libusb/lib/libusb-1.0.0.dylib pkg/.

# Change rpath to point to packaged libusb
cd pkg
install_name_tool -change /usr/local/opt/libusb/lib/libusb-1.0.0.dylib "@loader_path/libusb-1.0.0.dylib" dfu-util
install_name_tool -change /usr/local/opt/libusb/lib/libusb-1.0.0.dylib "@loader_path/libusb-1.0.0.dylib" dfu-prefix
install_name_tool -change /usr/local/opt/libusb/lib/libusb-1.0.0.dylib "@loader_path/libusb-1.0.0.dylib" dfu-suffix

zip -r ../output/dfu-util-${TRAVIS_TAG}.zip *

