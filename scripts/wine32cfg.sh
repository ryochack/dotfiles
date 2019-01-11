#!/bin/sh

xhost +SI:localuser:winer
sudo -u winer env WINEARH=win32 WINEPREFIX=/home/winer/.wine32 HOME=/home/winer USER=winer USERNAME=winer LOGNAME=winer winecfg "$@"

