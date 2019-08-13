#!/bin/bash
xhost +"local:docker@"

# modify this to store your chrome config in a different location on the host
CHROME_CONFIG_DIR=$HOME/.config/google-chrome

NUM_NVIDIA=$(find /dev -name nvidia\* | wc -l)
if [[ $NUM_NVIDIA -gt 0 ]] ; then
  NVIDIA_DEVICES=`ls -1 /dev/nvidia* | xargs -n1 -I{} echo -n "--device {} "`
fi

sudo docker run \
  -t \
  --rm \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  --user `id -u`:`id -g` \
  --shm-size 4g \
  --memory 4g \
  -v /etc/localtime:/etc/localtime:ro \
  -v $CHROME_CONFIG_DIR:$HOME/.config/google-chrome:rw \
  --device /dev/dri \
  $NVIDIA_DEVICES \
  --name google-chrome \
  google-chrome
