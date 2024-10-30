#!/bin/sh

# Check if flavor and flutter version are provided
if [ -z "$1" ]; then
  echo "Usage: ./build.sh <flutter_version>"
  exit 1
else
  echo "Building with Flutter version: $1"
fi

FLUTTER_VERSION=$1

if cd flutter; then 
  git pull && cd .. 
else 
  git clone --branch $FLUTTER_VERSION --single-branch https://github.com/flutter/flutter.git
fi

ls
flutter/bin/flutter doctor
flutter/bin/flutter clean
flutter/bin/flutter config --enable-web