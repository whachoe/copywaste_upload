#!/bin/sh

launchctl remove org.copywaste.upload
launchctl load -w ~/Library/LaunchAgents/copywaste_upload.plist
