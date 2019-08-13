# Docker Google Chrome

This repo contains file necessary to get Google Chrome running inside of a Docker container.

## Building

`./build.sh`

The resultant image is based on ubuntu:rolling and is roughly 675MB in size (Google Chrome pulls in a LOT of dependencies).

## Running 

`./run.sh`

The run script maps your Google Chrome config to your $HOME directory. If you want to place your config elsewhere, modify the script prior to running.