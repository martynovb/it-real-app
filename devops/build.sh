#!/bin/sh

# Check if flavor and flutter version are provided
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: ./build.sh <flavor> <flutter_version>"
  exit 1
fi

FLAVOR=$1
FLUTTER_VERSION=$2

if cd flutter; then 
  git pull && cd .. 
else 
  git clone --branch $FLUTTER_VERSION --single-branch https://github.com/flutter/flutter.git
fi

ls
flutter/bin/flutter doctor
flutter/bin/flutter clean
flutter/bin/flutter config --enable-web
sh .setup_vercel_variables.sh $FLAVOR