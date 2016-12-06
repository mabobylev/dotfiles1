#
# ~/.bash_profile
#
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx -- vt1 &> /dev/null
[[ -f ~/.bashrc ]] && . ~/.bashrc
