#!/bin/bash

# https://wiki.archlinuxjp.org/index.php/Xrandr#.E3.82.B9.E3.82.AF.E3.83.AA.E3.83.97.E3.83.88

MAIN="LVDS-1"
VGA="VGA-1"
DP="HDMI-1"

VGA_DETECTED=false
DP_DETECTED=false

MAIN_CFG="--output ${MAIN} --auto --primary"
VGA_CFG="--output ${VGA} --off"
DP_CFG="--output ${DP} --off"

status=$(xrandr)

if (echo $status | grep -q "$VGA connected"); then
    VGA_DETECTED=true
fi
if (echo $status | grep -q "$DP connected"); then
    DP_DETECTED=true
fi

if $VGA_DETECTED && $DP_DETECTED ; then
    MAIN_CFG="--output ${MAIN} --off"
    VGA_CFG="--output ${VGA} --auto --primary"
    DP_CFG="--output ${DP} --auto --right-of ${VGA} --rotate right"
elif $VGA_DETECTED ; then
    VGA_CFG="--output ${VGA} --auto --above ${MAIN}"
elif $DP_DETECTED ; then
    DP_CFG="--output ${DP} --auto --right-of ${MAIN} --rotate right"
fi

xrandr $MAIN_CFG $VGA_CFG $DP_CFG
