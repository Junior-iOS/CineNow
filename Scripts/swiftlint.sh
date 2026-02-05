#!/bin/bash

if which swiftlint > /dev/null; then
  swiftlint
else
  echo "warning: SwiftLint not installed. Download from https://github.com/realm/SwiftLint"
fi