#!/usr/bin/env sh
set -eu

WLAN_IF=wlp2s0

sudo rfkill unblock wlan
sudo ip link set dev $WLAN_IF up
nmcli r wifi on

