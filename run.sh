#!/bin/bash

# This script runs the Docker container. The Dockerfile's CMD will handle
# launching the Gemini CLI directly.

docker run --rm -it \
  --privileged \
  -v /dev/bus/usb:/dev/bus/usb \
  -v "$HOME/.gemini:/root/.gemini" \
  -v "$(pwd)/working-directory/:/working-directory/" \
  gemini-cli-image
