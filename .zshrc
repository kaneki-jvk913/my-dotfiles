
#-------------------------- alias ------------------------------#

 #alias zen=zen.AppImage


cd() {
    builtin cd "$@" && pwd
}

alias rm='trash'


alias dotfiles='/home/ayoub/.config/github-scripts/refresh-local-repo.sh'

# alias emacs='emacsclient -nw -a "" -c'
 alias emacs='emacsclient -c -a 'emacs''

 alias emacs-tui='/usr/bin/emacs -nw'
 
 alias lock-and-suspend='i3lock -i /home/ayoub/Downloads/photo/wallpaper/0-77.png -f -k && systemctl suspend'

 
#-------------------------- theme ------------------------------#

ZSH_THEME="robbyrussell"


#--------------------- envirement variables --------------------#

#QT_QPA_PLATFORM=wayland



# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh





#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#














