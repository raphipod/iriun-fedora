#!/bin/bash

# Check for dependencies: alien, v4l2loopback

if ! command -v alien &> /dev/null
then
  echo "alien not found. Installing..."
  sudo dnf install alien -y
fi

if ! v4l2loopback-ctl &> /dev/null
then
  echo "v4l2loopback not found. Installing..."
  sudo dnf install v4l2loopback -y
fi

# Download 

curl https://iriun.gitlab.io/iriunwebcam-2.8.1.deb --output iriunwebcam.deb

# Convert .deb package to .rpm using alien

sudo alien -r iriunwebcam.deb --target=x86_64

# Force-install iriunwebcam package with rpm (CHANGE UPON VERSION CHANGE!)

sudo rpm -Uvh iriunwebcam-2.8.1-2.x86_64.rpm --force
