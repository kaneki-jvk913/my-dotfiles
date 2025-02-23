#!/bin/bash

# Define source and destination directories
SRC_DIRS=(
"/home/ayoub/.config/alacritty"
"/home/ayoub/.config/bspwm"
"/home/ayoub/.config/btop"
"/home/ayoub/.config/cava"
"/home/ayoub/.config/fastfetch"
"/home/ayoub/.config/goa-1.0"
"/home/ayoub/.config/gtk-2.0"
"/home/ayoub/.config/gtk-3.0"
"/home/ayoub/.config/gtk-4.0"
"/home/ayoub/.config/hypr"
"/home/ayoub/.config/kitty"
"/home/ayoub/.config/nautilus"
"/home/ayoub/.config/neofetch"
"/home/ayoub/.config/nitrogen"
"/home/ayoub/.config/picom"
"/home/ayoub/.config/polybar"
"/home/ayoub/.config/swaync"
"/home/ayoub/.config/sxhkd"
"/home/ayoub/.config/waybar"
"/home/ayoub/.config/wireplumber"
"/home/ayoub/.config/wofi"
"/home/ayoub/.config/chrome-flags.conf"
"/home/ayoub/.config/chromium-flags.conf"
"/home/ayoub/.config/copy-script-config.sh"
"/home/ayoub/.config/copy-script-home-dots.sh"
)
DEST_DIR="/home/ayoub/backup-dotfiles/001-the-scripted-copy/.config"

# Create the destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Copy each source directory/file to the destination
for src in "${SRC_DIRS[@]}"; do
  cp -r "$src" "$DEST_DIR"
done

echo "Files and folders copied successfully to $DEST_DIR"
