#!/bin/bash

INSTALL_DIR="~/bin"

echo "Install packages we need for this to work.."
brew install terminal-notifier fswatch syncthing

echo "Making install directory"
mkdir -p ~/bin/copywaste_upload

echo "Installing binaries"
cp ./copywaste_upload.sh ./copywaste_upload_fswatch.sh ~/bin/copywaste_upload
chmod 755 ~/bin/copywaste_upload/*.sh

echo "Setup Launch Agent to automatically start when user logs in"
sed -e "s/USERNAME/$USER/g" ./copywaste_upload.plist > ~/Library/LaunchAgents/copywaste_upload.plist

# Start the listener
launchctl load -w ~/Library/LaunchAgents/copywaste_upload.plist
