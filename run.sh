#!/bin/bash

./.venv/bin/python ./photo_download.py

# Run the photo copy/move script
# Note: The CopyPhotos.sh script will prompt for the Organisation and Destination Network Folder
# unless you edit CopyPhotos.sh to set the DEFAULT_ORG and DEFAULT_DEST_PATH variables.
./copyphotos.sh