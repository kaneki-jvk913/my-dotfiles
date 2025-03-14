#!/bin/bash

# Run the scripts in order
/home/ayoub/.config/github-scripts/scripts/1-remove-old-configs.sh
/home/ayoub/.config/github-scripts/scripts/2-copy-script-config.sh
/home/ayoub/.config/github-scripts/scripts/3-copy-script-home-dots.sh

rm -r /home/ayoub/github-repo/my-dotfiles/.emacs.d/elpa/gnupg
rm -r /home/ayoub/github-repo/my-dotfiles/.emacs.d/auto-save-list
rm -r /home/ayoub/github-repo/my-dotfiles/.emacs.d/eln-cache



echo "Scripts executed successfully in order."

