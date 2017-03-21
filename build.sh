#!/bin/bash

cordova build --release android

# only for first release
# keytool -genkey -v -keystore schulzzug-release-key.keystore -alias alias_name -keyalg RSA -keysize 2048 -validity 10000
APKDIR=platforms/android/build/outputs/apk

jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore $APKDIR/schulzzug-release-key.keystore $APKDIR/android-release-unsigned.apk alias_name
~/Library/Android/sdk/build-tools/25.0.2/zipalign -v 4 $APKDIR/android-release-unsigned.apk ./schulzzug.apk


