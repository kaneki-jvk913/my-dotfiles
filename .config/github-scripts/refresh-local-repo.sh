#!/bin/bash

# Run the scripts in order
/home/ayoub/.config/github-scripts/scripts/1-remove-old-configs.sh
/home/ayoub/.config/github-scripts/scripts/2-copy-script-config.sh
/home/ayoub/.config/github-scripts/scripts/3-copy-script-home-dots.sh

rm -r /home/ayoub/.emacs.d/elpa/gnupg

echo "Scripts executed successfully in order."

