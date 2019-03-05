#!/usr/bin/env sh
set -eu

DEVICE=$1
udisksctl unmount --block-device $DEVICE --no-user-interaction
