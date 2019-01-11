#!/bin/sh

xhost +SI:localuser:winer
sudo -u winer env HOME=/home/winer USER=winer USERNAME=winer LOGNAME=winer wine "$@"

