#!/usr/bin/env sh
set -eu

DEVICE=$1
udisksctl mount --block-device $DEVICE --no-user-interaction
