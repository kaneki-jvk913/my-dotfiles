#!/bin/bash

# Define source and destination directories
SRC_DIRS=(
"/home/ayoub/.emacs.d"
"/home/ayoub/.vim"
"/home/ayoub/.bashrc"
"/home/ayoub/.emacs"
"/home/ayoub/.vimrc"
"/home/ayoub/.zshrc"
)
DEST_DIR="/home/ayoub/my-dotfiles"

# Create the destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Copy each source directory/file to the destination
for src in "${SRC_DIRS[@]}"; do
  cp -r "$src" "$DEST_DIR"
done

echo "Files and folders copied successfully to $DEST_DIR"
