#!/bin/bash

# https://wiki.archlinuxjp.org/index.php/Xrandr#.E3.82.B9.E3.82.AF.E3.83.AA.E3.83.97.E3.83.88

MAIN="LVDS1"
EXT="VGA1"

if (xrandr | grep -q "$EXT disconnected"); then
    xrandr --output $MAIN --auto --output $EXT --off 
else
    xrandr --output $MAIN --auto --primary --output $EXT --auto --above $MAIN
fi

