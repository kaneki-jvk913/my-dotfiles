#!/usr/bin/env bash 

#COLORSCHEME=DoomOne

### AUTOSTART PROGRAMS ###
#lxsession &
#picom --daemon &
/usr/bin/emacs --daemon &
nm-applet &
#"$HOME"/.screenlayout/layout.sh &
#sleep 1
#conky -c "$HOME"/.config/conky/qtile/01/"$COLORSCHEME".conf || echo "Couldn't start conky."

### UNCOMMENT ONLY ONE OF THE FOLLOWING THREE OPTIONS! ###
# 1. Uncomment to restore last saved wallpaper
#xargs xwallpaper --stretch < ~/.cache/wall &
# 2. Uncomment to set a random wallpaper on login
# find /usr/share/backgrounds/dtos-backgrounds/ -type f | shuf -n 1 | xargs xwallpaper --stretch &
# 3. Uncomment to set wallpaper with nitrogen



setxkbmap fr us-azerty &

nitrogen --restore &

xautolock -time 5 -locker "i3lock -i /home/ayoub/Downloads/photo/wallpaper/0-77.png -f -k" &

/usr/lib/polkit-kde-authentication-agent-1 &

picom &

