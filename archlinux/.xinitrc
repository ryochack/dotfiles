#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# twm &
# xterm -geometry 80x20+494-0 &
# exec xterm -geometry 80x66+0+0 -name login

export GTK_IM_MODULE='uim'
export QT_IM_MODULE='uim'
uim-xim &
export XMODIFIERS='@im=uim'

setxkbmap -layout us -option ctrl:nocaps

# Auto detect external display daemon
srandrd ~/service/display_handler_triple.sh

exec i3
# Start i3 and log to ~/.i3/logfile
# echo "Starting at $(date)" >> ~/.i3/logfile
# exec /usr/bin/i3 -V -d all >> ~/.i3/logfile

