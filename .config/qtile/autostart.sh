#!/usr/bin/env bash 

nitrogen --restore &

/usr/bin/emacs --daemon &

nm-applet &

dunst &

setxkbmap fr us-azerty &

xautolock -time 10 -locker "i3lock -i /home/ayoub/Downloads/photo/wallpaper/0-77.png -f -k" &

/usr/lib/polkit-kde-authentication-agent-1 &

picom &

