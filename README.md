![Copywaste Logo](https://copywaste.org/img/copywaste_logo.png)
# Copywaste uploader

## What?
Upload screenshots taken on OSX to https://copywaste.org and saves the url of the screenshot in your copy-paste buffer.

## Prerequisites
You need to have [Homebrew](https://brew.sh) installed. 
You need some way to sync a local folder. An example using [Syncthing](https://syncthing.net) is documented below.

## Installation
Run the script `./install.sh` which will install dependent packages and set up the scripts. 
Scripts will be installed in the folder `~/bin/copywaste_upload`.


### Set up Syncthing
To share a local folder and sync it to a remote server using Syncthing from the command line, you'll need to set up both devices and configure folder sharing. 

**1. Install and start Syncthing on both devices:**
```bash
# Start Syncthing (creates config if first run)
syncthing
```

**2. Get device IDs:**
```bash
# On local machine
syncthing -device-id

# On remote server  
syncthing -device-id
```

**3. Add the remote device as a peer:**
```bash
# Add remote device (replace with actual device ID)
syncthing cli config devices add --device-id "REMOTE-DEVICE-ID-HERE" --name "RemoteServer"
```

**4. Create and share a folder:**
```bash
# Add folder to sync
syncthing cli config folders add --id "my-folder" --path "/path/to/local/folder" --label "My Shared Folder"

# Share folder with remote device
syncthing cli config folders "my-folder" devices add --device-id "REMOTE-DEVICE-ID-HERE"
```

**5. On the remote server, accept the folder:**
```bash
# List pending folders
syncthing cli config folders pending

# Accept the shared folder
syncthing cli config folders add --id "my-folder" --path "/path/to/remote/folder"
```