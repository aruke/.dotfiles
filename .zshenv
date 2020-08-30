#! /bin/zsh env

# Android
export PATH=$PATH:~/Library/Android/sdk/platform-tools/
export PATH=$PATH:~/Library/Android/sdk/tools/bin/
export PATH=$PATH:~/Library/Android/sdk/emulator/emulator

# Android Studio Embedded Java: Failed
export PATH=$PATH:/Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home/bin
export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home

# Flutter
export PATH="$PATH:/usr/local/flutter/bin"

# Go
export GOPATH="~/.go-sdk/go1.14.4/bin"

# Mosquitto
export PATH=$PATH:/usr/local/Cellar/mosquitto/1.4.14_2/bin

export PATH="$HOME/.fastlane/bin:$PATH"
