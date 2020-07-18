#!/bin/bash

set -eo pipefail

xcodebuild -workspace Example/MarvelUIKit.xcworkspace \
            -scheme MarvelUIKit-Example \
            -destination platform=iOS\ Simulator,name=iPhone\ 11 \
            clean test | xcpretty
