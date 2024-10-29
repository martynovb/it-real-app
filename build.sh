#!/bin/bash

# Check if target name is provided
if [ -z "$1" ]; then
  echo "Error: No target name provided."
  echo "Usage: ./build.sh <target_name>"
  exit 1
fi

TARGET_NAME=$1

# Set the Flutter version
curl -o flutter.zip https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.3-stable.zip
unzip flutter.zip -d /usr/local
export PATH="$PATH:/usr/local/flutter/bin"

# Check Flutter installation
flutter doctor

# Install dependencies and build with dynamic target
flutter pub get
flutter build web --release --web-renderer html --target lib/targets/"${TARGET_NAME}"/main.dart
