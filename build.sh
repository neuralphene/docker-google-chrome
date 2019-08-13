#!/bin/bash
sudo docker build \
  --build-arg UID=$(id -u) \
  --build-arg GID=$(id -g) \
  --build-arg UNAME=$(whoami) \
  -t google-chrome .
