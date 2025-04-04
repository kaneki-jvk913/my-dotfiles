#!/bin/bash


# Define source and destination directories
SRC_DIRS=(

"/home/ayoub/suckless-builds-local/dwm"
"/home/ayoub/.dwm"
"/home/ayoub/.themes"
"/home/ayoub/.vim"
"/home/ayoub/.xmonad"
"/home/ayoub/.bashrc"
"/home/ayoub/.vimrc"
"/home/ayoub/.zshrc"
)
DEST_DIR="/home/ayoub/github-repo/my-dotfiles"

# Create the destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Copy each source directory/file to the destination
for src in "${SRC_DIRS[@]}"; do
  cp -r "$src" "$DEST_DIR"
done


mkdir /home/ayoub/github-repo/my-dotfiles/.emacs.d
cp -r /home/ayoub/.emacs.d/themes /home/ayoub/github-repo/my-dotfiles/.emacs.d/
cp /home/ayoub/.emacs.d/init.el /home/ayoub/github-repo/my-dotfiles/.emacs.d/
cp /home/ayoub/.emacs.d/my-keybinds /home/ayoub/github-repo/my-dotfiles/.emacs.d/

echo "Files and folders copied successfully to $DEST_DIR"
